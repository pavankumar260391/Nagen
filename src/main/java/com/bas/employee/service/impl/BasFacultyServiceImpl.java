package com.bas.employee.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bas.admin.dao.entity.HolidayEntryEntity;
import com.bas.employee.dao.BasFacultyDao;
import com.bas.employee.dao.entity.FaculityLeaveMasterEntity;
import com.bas.employee.dao.entity.FacultyAttendStatusEntity;
import com.bas.employee.dao.entity.FacultyEntity;
import com.bas.employee.dao.entity.FacultySalaryMasterEntity;
import com.bas.employee.dao.entity.ManualAttendanceEntity;
import com.bas.employee.service.BasFacultyService;
import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;
import com.bas.employee.web.controller.form.FacultyAttendStatusVO;
import com.bas.employee.web.controller.form.FacultyForm;
import com.bas.employee.web.controller.form.FacultySalaryMasterVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

@Service("BasFacultyServiceImpl")
@Transactional
public class BasFacultyServiceImpl implements BasFacultyService {

	@Autowired
	@Qualifier("BasFacultyDaoImpl")
	private BasFacultyDao basFacultyDao;

	@Override
	public String persistFaculty(FacultyForm facultyForm) {
		FacultyEntity facultyEntity = new FacultyEntity();
		BeanUtils.copyProperties(facultyForm, facultyEntity);
		return basFacultyDao.persistFaculty(facultyEntity);
	}

	@Override
	public String updateFaculty(FacultyForm facultyForm) {
		FacultyEntity facultyEntity = new FacultyEntity();
		BeanUtils.copyProperties(facultyForm, facultyEntity);
		return basFacultyDao.updateFaculty(facultyEntity);
	}

	@Override
	public String deletetFaculty(String name) {
		return basFacultyDao.deletetFaculty(name);
	}

	@Override
	public FacultyForm findFacultyByName(String name) {
		FacultyEntity facultyEntity = basFacultyDao.findFacultyByName(name);
		FacultyForm facultyForm = new FacultyForm();
		BeanUtils.copyProperties(facultyEntity, facultyForm);
		return facultyForm;
	}

	@Override
	public List<FacultyForm> findAllFaculty() {
		List<FacultyEntity> facultyEntities = basFacultyDao.findAllFaculty();
		List<FacultyForm> facultyForms = new ArrayList<FacultyForm>();
		for (FacultyEntity fe : facultyEntities) {
			FacultyForm facultyForm = new FacultyForm();
			BeanUtils.copyProperties(fe, facultyForm);
			facultyForms.add(facultyForm);
		}
		return facultyForms;
	}

	@Override
	public byte[] findPhotoByName(String name) {
		return basFacultyDao.findPhotoByName(name);
	}

	@Override
	public FaculityLeaveMasterVO findLeaveBalance(String empid) {
		FaculityLeaveMasterEntity faculityLeaveMasterEntity = basFacultyDao
				.findLeaveBalance(empid);
		FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
		BeanUtils.copyProperties(faculityLeaveMasterEntity,
				faculityLeaveMasterVO);
		return faculityLeaveMasterVO;
	}

	@Override
	public List<FaculityLeaveMasterVO> findLeaveHistory(String empid) {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntitieslist = basFacultyDao
				.findLeaveHistory(empid);
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = new ArrayList<FaculityLeaveMasterVO>();
		for (FaculityLeaveMasterEntity flh : faculityLeaveMasterEntitieslist) {
			FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(flh, faculityLeaveMasterVO);
			faculityLeaveMasterVOslist.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOslist;
	}

	@Override
	public List<FacultyAttendStatusVO> findAttendStatus(String fid,int month) {
		List<FacultyAttendStatusEntity> attendStatusEntities = basFacultyDao
				.findAttendStatus(fid,month);
		List<FacultyAttendStatusVO> facultyAttendStatusVOList = new ArrayList<FacultyAttendStatusVO>();
		for (FacultyAttendStatusEntity fe : attendStatusEntities) {
			FacultyAttendStatusVO facultyAttendStatusVO = new FacultyAttendStatusVO();
			BeanUtils.copyProperties(fe, facultyAttendStatusVO);
			facultyAttendStatusVOList.add(facultyAttendStatusVO);
		}
		return facultyAttendStatusVOList;
	}

	@Override
	public List<FacultySalaryMasterVO> findSalaryHistory(String empid) {
		List<FacultySalaryMasterEntity> facultySalaryMasterEntitieslist = basFacultyDao
				.findSalaryHistory(empid);
		List<FacultySalaryMasterVO> facultySalaryMasterVOslist = new ArrayList<FacultySalaryMasterVO>();
		for (FacultySalaryMasterEntity fs : facultySalaryMasterEntitieslist) {
			FacultySalaryMasterVO facultySalaryMasterVO = new FacultySalaryMasterVO();
			BeanUtils.copyProperties(fs, facultySalaryMasterVO);
			facultySalaryMasterVOslist.add(facultySalaryMasterVO);
		}
		return facultySalaryMasterVOslist;
	}

	@Override
	public FaculityLeaveMasterVO findLeaveAppData(String empid/*,String leaveMonth*/) {
		FaculityLeaveMasterEntity faculityLeaveMasterEntity = basFacultyDao
				.findLeaveAppData(empid/*,leaveMonth*/);
		FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
		BeanUtils.copyProperties(faculityLeaveMasterEntity,
				faculityLeaveMasterVO);
		return faculityLeaveMasterVO;
	}

	@Override
	public void addLeaveEntry(FaculityLeaveMasterVO faculityLeaveMasterVO) {
		System.out.println("before Dao" + faculityLeaveMasterVO.getLeaveFrom());
		FaculityLeaveMasterEntity faculityLeaveMasterEntity=new FaculityLeaveMasterEntity();
		BeanUtils.copyProperties(faculityLeaveMasterVO, faculityLeaveMasterEntity);
		basFacultyDao.addLeaveEntry(faculityLeaveMasterEntity);
	}

	@Override
	public byte[] findEmpPhotoByName(String name) {
		return basFacultyDao.findPhotoByEmpName(name);
	}

	@Override
	public String enterLeaveHistory(FaculityLeaveMasterVO faculityLeaveMasterVO) {
		return basFacultyDao.enterLeaveHistory(faculityLeaveMasterVO);
	}

	@Override
	public List<FaculityLeaveMasterVO> findAllLeaveHistory() {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntitieslist = basFacultyDao
				.findAllLeaveHistory();
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = new ArrayList<FaculityLeaveMasterVO>();
		for (FaculityLeaveMasterEntity flh : faculityLeaveMasterEntitieslist) {
			FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(flh, faculityLeaveMasterVO);
			faculityLeaveMasterVOslist.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOslist;

	}

	@Override
	public List<FaculityLeaveMasterVO> findAllEmpDb() {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntitieslist = basFacultyDao
				.findAllEmpDb();
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = new ArrayList<FaculityLeaveMasterVO>();
		for (FaculityLeaveMasterEntity flh : faculityLeaveMasterEntitieslist) {
			FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(flh, faculityLeaveMasterVO);
			faculityLeaveMasterVOslist.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOslist;
	}

	@Override
	public String deleteLeaveHistory(String name, String date) {
		return basFacultyDao.deleteLeaveHistory(name, date);

	}

	@Override
	public ManualAttendanceVO findEmployeeDataForAttendance(String empid) {
		ManualAttendanceEntity manualAttendanceEntity = basFacultyDao
				.findEmployeeDataForAttendance(empid);
		ManualAttendanceVO manualAttendanceVO = new ManualAttendanceVO();
		BeanUtils.copyProperties(manualAttendanceEntity,manualAttendanceVO);
		return manualAttendanceVO;
	}

	@Override
	public String addEmployeeManulAttendance(
			ManualAttendanceVO manualAttendanceVO) {
		ManualAttendanceEntity manualAttendanceEntity = new ManualAttendanceEntity();
		BeanUtils.copyProperties(manualAttendanceVO, manualAttendanceEntity);
		return basFacultyDao.addEmployeeManulAttendance(manualAttendanceEntity);
	}

	@Override
	public List<FaculityLeaveMasterVO> findAllPendingLeaveHistory() {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntitieslist = basFacultyDao
				.findAllPendingLeaveHistory();
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = new ArrayList<FaculityLeaveMasterVO>();
		for (FaculityLeaveMasterEntity flh : faculityLeaveMasterEntitieslist) {
			FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(flh, faculityLeaveMasterVO);
			faculityLeaveMasterVOslist.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOslist;
	}

	@Override
	public void updateLeaveHistory(String empNo, String date, String lstatus) {
		basFacultyDao.updateLeaveHistory(empNo, date,lstatus);
	}

	@Override
	public List<FaculityLeaveMasterVO> getReportingManagerList() {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntities=basFacultyDao.getReportingManagerList();
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOs=new ArrayList<FaculityLeaveMasterVO>(); 
		for (FaculityLeaveMasterEntity faculityLeaveMasterEntity : faculityLeaveMasterEntities) {
			FaculityLeaveMasterVO faculityLeaveMasterVO=new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(faculityLeaveMasterEntity, faculityLeaveMasterVO);
			faculityLeaveMasterVOs.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOs;
	}

	@Override
	public List<FaculityLeaveMasterVO> getCCToList() {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntities=basFacultyDao.getCCToList();
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOs=new ArrayList<FaculityLeaveMasterVO>(); 
		for (FaculityLeaveMasterEntity faculityLeaveMasterEntity : faculityLeaveMasterEntities) {
			FaculityLeaveMasterVO faculityLeaveMasterVO=new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(faculityLeaveMasterEntity, faculityLeaveMasterVO);
			faculityLeaveMasterVOs.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOs;
	}

	@Override
	public String enterRmLeaveHistory(
			FaculityLeaveMasterVO faculityLeaveMasterVO) {
		return basFacultyDao.enterRmLeaveHistory(faculityLeaveMasterVO);

	}

	@Override
	public List<FaculityLeaveMasterVO> findAllRmPendingLeaveHistory() {
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntitieslist = basFacultyDao
				.findAllRmPendingLeaveHistory();
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = new ArrayList<FaculityLeaveMasterVO>();
		for (FaculityLeaveMasterEntity flh : faculityLeaveMasterEntitieslist) {
			FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
			BeanUtils.copyProperties(flh, faculityLeaveMasterVO);
			faculityLeaveMasterVOslist.add(faculityLeaveMasterVO);
		}
		return faculityLeaveMasterVOslist;
	}
	
	@Override
	public String updateEmployee(FacultyAttendStatusVO dfaAttendStatusVO, String fid, String newdate){
		FacultyAttendStatusEntity facultyAttendStatusEntity = new FacultyAttendStatusEntity();
		BeanUtils.copyProperties(dfaAttendStatusVO, facultyAttendStatusEntity);
		return basFacultyDao.updateEmployee(facultyAttendStatusEntity, fid, newdate);
	}

	@Override
	public String deleteAttendus(String employeeId, String attndDate) {		
		return basFacultyDao.deleteAttendus(employeeId,attndDate);
	}


}
