package model.dao;

import java.util.List;

import model.dto.VideoDto;
import model.util.DBUtil;

public class VideoDaoImpl implements VideoDao {
	private DBUtil util = DBUtil.getInstance();
	private static VideoDao dao = new VideoDaoImpl();

	private VideoDaoImpl() {

	}

	public static VideoDao getInstance() {
		return dao;
	}

	@Override
	public List<VideoDto> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoDto selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertVideo(VideoDto video) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateVideo(VideoDto video) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteVideo(int id) {
		// TODO Auto-generated method stub

	}
}
