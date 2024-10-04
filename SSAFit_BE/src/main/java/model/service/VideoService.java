package model.service;

import java.util.List;

import model.dto.VideoDto;

public interface VideoService {

	public abstract List<VideoDto> getList();

	public abstract VideoDto getVideo(int id);

//	public abstract void writeVideo(VideoDto video);
//
//	public abstract void modifyVideo(VideoDto video);
//
//	public abstract void removeVideo(int id);

}
