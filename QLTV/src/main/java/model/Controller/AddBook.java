package model.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.descriptor.web.MultipartDef;

import model.BO.BookBO;
import model.BO.CategoryBO;
import model.Bean.Book;
import model.Bean.Category;

@MultipartConfig
@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryBO categoryBO = new CategoryBO();
	private BookBO bookBO = new BookBO();


	public AddBook() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("User") == null) {
			String errorString = "Ban can dang nhap truoc";
			request.setAttribute("errorString", errorString);
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		} else {

			String errorString = null;
			ArrayList<Category> list = null;

			try {
				list = categoryBO.listCategory();
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
			if (request.getAttribute("errorString") != null) {
				errorString = (String) request.getAttribute("errorString");
			}
			request.setAttribute("errorString", errorString);
			request.setAttribute("categoryList", list);
			request.getSession().setAttribute("Check", "AddBook");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/add_book.jsp");
			dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String category_id = request.getParameter("category");
		String count = request.getParameter("count");
		Part fileImage = request.getPart("fileImage");
		String savePathImage = getServletContext().getRealPath("/") + "Resources\\img\\products";
		Part fileEbook = request.getPart("fileBook");
		String savePathBook = getServletContext().getRealPath("/") + "Resources\\img\\ebooks";
		File fileSaveDirImage = new File(savePathImage);
		File fileSaveDirBook = new File(savePathBook);
		if (!fileSaveDirImage.exists()&& !fileSaveDirBook.exists()) {
			fileSaveDirImage.mkdir();
			fileSaveDirImage.mkdir();
		}
		String fileNameImage = extractfilename(fileImage);
		String fileNameBook = extractfilename(fileEbook);
		fileImage.write(savePathImage + File.separator + fileNameImage);
		fileEbook.write(savePathBook + File.separator + fileNameBook);
		Book book = new Book();
		book.setName(name);
		Category category = new Category();
		try {
			category = categoryBO.findCategory(category_id);
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
		}
		book.setCategory(category);
		book.setAmount(count);
		book.setImage(fileNameImage);
		book.setBookfile(fileNameBook);
		try {
			int result = bookBO.insertBook(book);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("errorString", "Them thanh cong");
		doGet(request, response);
	}

	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}

}
