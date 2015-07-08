package com.bas.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bas.admin.dao.HolidayEntryDao;
import com.bas.admin.dao.entity.DesignationEntity;
import com.bas.admin.dao.entity.HolidayEntryEntity;
import com.bas.admin.service.HolidayEntryService;
import com.bas.admin.web.controller.form.DesignationForm;
import com.bas.admin.web.controller.form.HolidayEntryForm;

@Service("HolidayEntryServiceImpl")
@Transactional
public class HolidayEntryServiceImpl implements HolidayEntryService{
	
	
	@Autowired
	@Qualifier("HolidayEntryDaoImpl")
	private HolidayEntryDao holidayEntryDao;

	@Override
	public String addHolidayEntry(HolidayEntryForm holidayEntryForm) {
		HolidayEntryEntity holidayEntryEntity=new HolidayEntryEntity();
		BeanUtils.copyProperties(holidayEntryForm, holidayEntryEntity);
		String result=holidayEntryDao.addHolidayEntry(holidayEntryEntity);
		return result;
	}

	@Override
	public String editHolidayEntry(HolidayEntryForm holidayEntryForm) {
		HolidayEntryEntity holidayEntryEntity = new HolidayEntryEntity();
		BeanUtils.copyProperties(holidayEntryForm, holidayEntryEntity);
		String res = holidayEntryDao.editHolidayEntry(holidayEntryEntity);
		return res;
	}

	@Override
	public String deleteHolidayEntry(String date) {
return holidayEntryDao.deleteHolidayEntry(date);
		
	}

	@Override
	public List<HolidayEntryForm> findHolidayEntry() {
List<HolidayEntryEntity> holidayEntryEntities=holidayEntryDao.findHolidayEntry();
List<HolidayEntryForm> holidayEntryForms= new ArrayList<HolidayEntryForm>();
for (HolidayEntryEntity holidayEntryEntity : holidayEntryEntities) {
	HolidayEntryForm hf=new HolidayEntryForm();
BeanUtils.copyProperties(holidayEntryEntity, hf);
holidayEntryForms.add(hf);
}
return holidayEntryForms;
	 	
}

	@Override
	public HolidayEntryForm findHolidayEntryByDate(String date) {
		HolidayEntryEntity holidayEntryEntity = holidayEntryDao
				.findHolidayEntryByDate(date);
		HolidayEntryForm holidayEntryForm = new HolidayEntryForm();
		BeanUtils.copyProperties(holidayEntryEntity, holidayEntryForm);
		return holidayEntryForm;
		
		
		
	}


	

	
}
