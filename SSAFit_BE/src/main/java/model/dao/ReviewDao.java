package model.dao;

import java.util.List;

import model.dto.ReviewDto;

public interface ReviewDao {
	public List<ReviewDto> selectAll();

	public ReviewDto selectOne(int id);

	public void insertReview(ReviewDto review);

	public void updateReview(ReviewDto review);

	public void deleteReview(int id);

}
