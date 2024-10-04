package model.service;

import java.util.List;

import model.dao.UserDao;
import model.dao.UserDaoImpl;
import model.dto.UserDto;

public class UserServiceImpl implements UserService {

	private static UserService service = new UserServiceImpl();
	private UserDao dao = UserDaoImpl.getInstance();

	private UserServiceImpl() {
	}

	public static UserService getInstance() {
		return service;
	}

	@Override
	public List<UserDto> getList() {
		return dao.selectAll();
	}

	@Override
	public UserDto getUser(int id) {
		return dao.selectOne(id);
	}

	@Override
	public void writeUser(UserDto user) {
		dao.insertUser(user);
	}

	@Override
	public void modifyUser(UserDto user) {
		dao.updateUser(user);
	}

	@Override
	public void removeUser(int id) {
		dao.deleteUser(id);
	}

}
