package model.dao;

import java.util.List;

import model.dto.VideoDto;

public interface VideoDao {
	public List<VideoDto> selectAll();

	public VideoDto selectOne(int id);

	public void insertVideo(VideoDto video);

	public void updateVideo(VideoDto video);

	public void deleteVideo(int id);

}
