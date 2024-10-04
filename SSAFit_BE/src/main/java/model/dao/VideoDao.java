package model.dao;

import java.util.List;

import model.dto.VideoDto;

public interface VideoDao {
	public List<VideoDto> selectAll();

	public VideoDto selectOne(int id);

	public void updateViews(int id);

}
