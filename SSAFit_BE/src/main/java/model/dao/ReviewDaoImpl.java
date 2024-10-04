package model.dao;

import java.util.List;

import model.dto.ReviewDto;
import model.util.DBUtil;

public class ReviewDaoImpl implements ReviewDao {
	private DBUtil util = DBUtil.getInstance();
	private static ReviewDao dao = new ReviewDaoImpl();

	private ReviewDaoImpl() {

	}

	public static ReviewDao getInstance() {
		return dao;
	}

	@Override
	public List<ReviewDto> selectAll() {
		return null;
	}

	@Override
	public ReviewDto selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReview(ReviewDto review) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReview(ReviewDto review) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReview(int id) {
		// TODO Auto-generated method stub

	}

}
