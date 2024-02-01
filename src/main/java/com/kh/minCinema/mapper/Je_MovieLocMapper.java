package com.kh.minCinema.mapper;


import java.util.List;

import com.kh.minCinema.domain.Je_MovieReservDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;



public interface Je_MovieLocMapper {

	public List<String> movieReservedSeats(Je_MovieReservDTO je_MovieReservDTO);
}
