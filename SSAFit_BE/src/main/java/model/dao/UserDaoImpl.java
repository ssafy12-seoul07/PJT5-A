package model.dao;

import java.util.List;

import model.dto.UserDto;
import model.util.DBUtil;

public class UserDaoImpl implements UserDao {
	private DBUtil util = DBUtil.getInstance();
	private static UserDao dao = new UserDaoImpl();

	private UserDaoImpl() {

	}

	public static UserDao getInstance() {
		return dao;
	}

	@Override
	public List<UserDto> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDto selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUser(UserDto user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUser(UserDto user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub

	}
}
