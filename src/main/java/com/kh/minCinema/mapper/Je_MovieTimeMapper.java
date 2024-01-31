package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieReservDTO;

public interface Je_MovieTimeMapper {

	public List<Je_MovieReservDTO> movieStartTimes(String movieDateCode);
}
