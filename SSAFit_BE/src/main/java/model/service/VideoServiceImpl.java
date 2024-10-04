package model.service;

import java.util.List;

import model.dao.VideoDao;
import model.dao.VideoDaoImpl;
import model.dto.VideoDto;

public class VideoServiceImpl implements VideoService {
	private static VideoService service = new VideoServiceImpl();
	private VideoDao dao = VideoDaoImpl.getInstance();

	private VideoServiceImpl() {
	}

	private static VideoService getInstance() {
		return service;
	}

	@Override
	public List<VideoDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VideoDto getVideo(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeVideo(VideoDto video) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyVideo(VideoDto video) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeVideo(int id) {
		// TODO Auto-generated method stub

	}

}
