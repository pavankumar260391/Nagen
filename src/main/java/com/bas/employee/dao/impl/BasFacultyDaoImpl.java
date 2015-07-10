package com.bas.employee.dao.impl;

import java.sql.Types;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.bas.employee.dao.BasFacultyDao;
import com.bas.employee.dao.entity.FaculityLeaveMasterEntity;
import com.bas.employee.dao.entity.FacultyAttendStatusEntity;
import com.bas.employee.dao.entity.FacultyEntity;
import com.bas.employee.dao.entity.FacultySalaryMasterEntity;
import com.bas.employee.dao.entity.ManualAttendanceEntity;
import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;

@Repository("BasFacultyDaoImpl")
@Transactional
/*the new code by kushal for registration page */
public class BasFacultyDaoImpl extends JdbcDaoSupport implements BasFacultyDao {

	/**
	 * This is setting datasource in super class
	 * 
	 * @param dataSource
	 */
	@Autowired
	@Qualifier("sdatasource")
	public void setDataSourceInSuper(DataSource dataSource) {
		super.setDataSource(dataSource);
	}
	
	@Override
	public String updateEmployee(FacultyAttendStatusEntity facultyAttendStatusEntity, String fid, String newdate){
		String sql = "UPDATE faculity_att_tab SET intime=?,outtime=?,intimestatus=?,outtimestatus=?,detail=?,present=? WHERE fid=? and Date(cdate)=?";
		Object[] object = new Object[] {facultyAttendStatusEntity.getIntime(),facultyAttendStatusEntity.getOuttime(),
			facultyAttendStatusEntity.getIntimestatus(),facultyAttendStatusEntity.getOuttimestatus(),
			facultyAttendStatusEntity.getDetail(),facultyAttendStatusEntity.getPresent(),fid,newdate};
		super.getJdbcTemplate().update(sql, object);
		return "Attendus Updated Success";
	}
	
	@Override
	public String deleteAttendus(String employeeId, String attndDate){
		String sql = "Delete from faculity_att_tab where fid=? and Date(cdate)=?";
		super.getJdbcTemplate().update(sql,new Object[]{employeeId,attndDate});
		return "Attendus Deleted Successfuly";
	}


	//put all the queries in the sql file
	@Override
	public String persistFaculty(FacultyEntity facultyEntity) {
		LobHandler lobHandler = new DefaultLobHandler();
		SqlLobValue image = new SqlLobValue(facultyEntity.getImage(),
				lobHandler);
		SqlLobValue rthumbimage = new SqlLobValue(facultyEntity.getRightThumb(),
				lobHandler);
		SqlLobValue lthumbimage = new SqlLobValue(facultyEntity.getLeftThumb(),
				lobHandler);
		Object data[] = new Object[] { facultyEntity.getId(),facultyEntity.getName(),facultyEntity.getFatherName(),facultyEntity.getMotherName(),
				facultyEntity.getSpouseName(),facultyEntity.getGuardianName(),facultyEntity.getEmail(),facultyEntity.getPaddress(),
				facultyEntity.getPhoneNumber(),facultyEntity.getDob(),facultyEntity.getSex(),facultyEntity.getMaritalStatus(),
				facultyEntity.getBloodGroup(),facultyEntity.getDesignation(),facultyEntity.getDepartment(), facultyEntity.getType(),
				facultyEntity.getCategory(),facultyEntity.getDoj(),facultyEntity.getDiploma(),facultyEntity.getBatchlourDegree(),
				facultyEntity.getMastersDegree(),facultyEntity.getPostMastersDegree(),facultyEntity.getOtherQualification(),
				image,lthumbimage,rthumbimage,facultyEntity.getDescription(),facultyEntity.getDom(),facultyEntity.getDoe()};

		String query = "insert into emp_db values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";



		int dataTye[] = new int[] { Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
				Types.BLOB,Types.BLOB,Types.BLOB, Types.VARCHAR, Types.DATE, Types.DATE};
		super.getJdbcTemplate().update(query, data, dataTye);
		return "ahahha";
	}

	@Override
	public String updateFaculty(FacultyEntity facultyEntity) {
		/*LobHandler lobHandler = new DefaultLobHandler();
		SqlLobValue cimage = new SqlLobValue(facultyEntity.getPhoto(),
				lobHandler);
		Object data[] = new Object[] { facultyEntity.getDesignation(),
				facultyEntity.getMobile(), facultyEntity.getGender(),
				facultyEntity.getEmail(), facultyEntity.getDegree(),
				facultyEntity.getFatherName(), facultyEntity.getDepartment(),
				facultyEntity.getAddress(), cimage, facultyEntity.getName() };
		String query = "update faculty_tbl set  designation=?,mobile=?,gender=?,email=?,degree=?,fatherName=?,department=?,address=?,photo=? where name=?";
		int dataTye[] = new int[] { Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.VARCHAR, Types.BLOB, Types.VARCHAR };
		super.getJdbcTemplate().update(query, data, dataTye);*/
		return "ahahha";
	}

	@Override
	public String deletetFaculty(String name) {
		String query = "delete from faculty_tbl where name=?";
		super.getJdbcTemplate().update(query, name);
		return "deleted";
	}

	@Override
	public List<FacultyEntity> findAllFaculty() {
		//dont use * just use column name because column might be added or deleted
		String query = "select * from faculty_tbl";
		List<FacultyEntity> facultyEntities = super.getJdbcTemplate().query(
				query, new BeanPropertyRowMapper(FacultyEntity.class));
		return facultyEntities;
	}

	@Override
	//dont fetch the whole data when u need only the image
	public byte[] findPhotoByName(String name) {
		String query = "select * from faculty_tbl where name='" + name + "'";
		FacultyEntity facultyEntitie = null;
		try {
			facultyEntitie = (FacultyEntity) super.getJdbcTemplate()
					.queryForObject(query,
							new BeanPropertyRowMapper(FacultyEntity.class));
		} catch (EmptyResultDataAccessException exception) {
			exception.printStackTrace();
		}
		return facultyEntitie.getImage();
	}

	@Override
	public FacultyEntity findFacultyByName(String name) {
		String query = "select * from faculty_tbl where name='" + name + "'";
		FacultyEntity facultyEntitie = null;
		try {
			facultyEntitie = (FacultyEntity) super.getJdbcTemplate()
					.queryForObject(query,
							new BeanPropertyRowMapper(FacultyEntity.class));
		} catch (EmptyResultDataAccessException exception) {
			exception.printStackTrace();
		}
		return facultyEntitie;
	}

	@Override
	public FaculityLeaveMasterEntity findLeaveBalance(String empid) {
		String squery = "select lb.empNo,e.name, e.designation,e.department ,lb.leaveMonth,lb.totalCL,lb.totalSL,lb.totalEL,lb.OD from emp_leave_balance as lb,emp_db as e where lb.empNo=e.id and lb.empNo=?";
		FaculityLeaveMasterEntity faculityLeaveMasterEntity = null;
		try {
			faculityLeaveMasterEntity = (FaculityLeaveMasterEntity) super
					.getJdbcTemplate()
					.queryForObject(
							squery,
							new Object[] { Integer.parseInt(empid) },
							new BeanPropertyRowMapper<FaculityLeaveMasterEntity>(
									FaculityLeaveMasterEntity.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return faculityLeaveMasterEntity;
	}

	@Override
	public List<FaculityLeaveMasterEntity> findLeaveHistory(String empid) {
		String squery = "select lh.empNo,e.`name`, e.designation,e.department ,lh.leaveType,lh.leaveCategory,lh.lstatus,lh.purpose,lh.ldateFrom as leaveFrom,lh.ldateTo as leaveTo,lh.totalDays from emp_leave_history as lh,emp_db as e where lh.empNo=e.id and lh.empNo=?";
		List<FaculityLeaveMasterEntity> faculityLeaveMasterEntitieslist = null;
		try {
			faculityLeaveMasterEntitieslist = (List<FaculityLeaveMasterEntity>) super
					.getJdbcTemplate()
					.query(squery,
							new Object[] { Integer.parseInt(empid) },
							new BeanPropertyRowMapper<FaculityLeaveMasterEntity>(
									FaculityLeaveMasterEntity.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return faculityLeaveMasterEntitieslist;

	}

	@Override
	public List<FacultyAttendStatusEntity> findAttendStatus(String fid,int month) {
		String dquery="select s.cdate,s.intime,s.intimestatus,s.outtime,s.outtimestatus,s.status,s.detail,s.present  from faculity_att_tab as s   where s.fid="
                + fid + "  and month(s.cdate) = "+ month +" order by s.cdate asc";
		List<FacultyAttendStatusEntity> facultyAttendStatusEntitieslist = getJdbcTemplate()
				.query(dquery,
						new BeanPropertyRowMapper<FacultyAttendStatusEntity>(
								FacultyAttendStatusEntity.class));
		return facultyAttendStatusEntitieslist;
	}

	@Override
	public List<FacultySalaryMasterEntity> findSalaryHistory(String empid) {
		boolean bbb = TransactionSynchronizationManager
				.isActualTransactionActive();
		if (bbb) {
			if(logger.isDebugEnabled()){
				logger.debug("____Ahahahah Spring tx is working and discuss later______");
			}
		}
		/*
		 * java.util.Date date = new java.util.Date(); String dtformat= "MMM";
		 * SimpleDateFormat sdf = new SimpleDateFormat(dtformat); Calendar c =
		 * Calendar.getInstance(); int monthMaxDays =
		 * c.getActualMaximum(Calendar.DAY_OF_MONTH);
		 * 
		 * int monthMaxDays = 30; String cdate =
		 * DateUtils.getCurrentDateSQLDB();
		 * 
		 * String cntquery =
		 * "SELECT COUNT(*) FROM holiday_entry_tbl WHERE cdate<'" + cdate + "'";
		 * int numHol = super.getJdbcTemplate().queryForObject(cntquery,
		 * Integer.class); int totworkdays = monthMaxDays - numHol; int
		 * leavetotal = 0;
		 * 
		 * String leavetknqry =
		 * "SELECT el.totalDays FROM emp_leave_history AS el WHERE ldateFrom<'"
		 * + cdate + "'"; List<Integer> leavetotallist =
		 * super.getJdbcTemplate().queryForList( leavetknqry, Integer.class);
		 * 
		 * for (Integer i : leavetotallist) { leavetotal += i; }
		 * 
		 * int daysworked = totworkdays - leavetotal;
		 * 
		 * String insquery =
		 * "insert into faculty_salary_table values(?,?,?,?,?,?,?,?,?,?,?)";
		 * Object[] data = new Object[] { Integer.parseInt(empid), cdate,
		 * daysworked, leavetotal, totworkdays, 1000, "CS", "paid in Full",
		 * cdate, cdate, "null" }; super.getJdbcTemplate().update(insquery,
		 * data);
		 */

		int eidfin = Integer.parseInt(empid);
		String query = "SELECT sal.empid as eid,sal.month,sal.daysworked,sal.noleaves,sal.totworkdays,sal.salpaid,sal.comment FROM admin_salary_table AS sal WHERE sal.empid="
				+ eidfin + "";
		List<FacultySalaryMasterEntity> facultySalaryMasterEntitieslist = super
				.getJdbcTemplate().query(
						query,
						new BeanPropertyRowMapper<FacultySalaryMasterEntity>(
								FacultySalaryMasterEntity.class));
		return facultySalaryMasterEntitieslist;
	}

	@Override
	public ManualAttendanceEntity findEmployeeDataForAttendance(String empid) {
		String lquery = "select e.id as eid,e.name,e.designation,e.department,e.type from emp_db as e where e.id=?";
		ManualAttendanceEntity manualAttendanceEntity = (ManualAttendanceEntity) super
				.getJdbcTemplate()
				.queryForObject(lquery, new Object[] { empid },
						new BeanPropertyRowMapper(ManualAttendanceEntity.class));
		return manualAttendanceEntity;
	}

	@Override
	public FaculityLeaveMasterEntity findLeaveAppData(String empid/*,String leaveMonth*/) {
		//	String lquery = "select e.id as empNo,e.name,e.designation,e.department,e.type,eb.totalCL,eb.totalSL,eb.totalEL,eb.od,e.paddress as address from emp_db as e,emp_leave_balance as eb where (eb.empNo=e.id and e.id=?) and MONTH(eb.leaveMonth)=?";
		String lquery = "select e.id as empNo,e.name,e.designation,e.department,e.type,eb.totalCL,eb.totalSL,eb.totalEL,eb.od,e.paddress as address from emp_db as e,emp_leave_balance as eb where (eb.empNo=e.id and e.id=?) ";

		FaculityLeaveMasterEntity faculityLeaveMasterEntity = (FaculityLeaveMasterEntity) super
				.getJdbcTemplate().queryForObject(
						lquery,
						new Object[] { empid/*,leaveMonth*/ },
						new BeanPropertyRowMapper(
								FaculityLeaveMasterEntity.class));
		//logger
		System.out.println(faculityLeaveMasterEntity.getTotalCL());
		return faculityLeaveMasterEntity;
	}

	@Override
    public void addLeaveEntry(
            FaculityLeaveMasterEntity faculityLeaveMasterEntity) {
        // TODO Auto-generated method stub
        System.out.println("before insert query" + faculityLeaveMasterEntity.getLeaveFrom());
        System.out.println("before insert query" + faculityLeaveMasterEntity.getMobile());
        String sql = "insert into leave_entry_tbl values(?,?,?,?,?,?,?,?,?,?)";
        Object[] data = new Object[] { 
                faculityLeaveMasterEntity.getLeaveFrom(),
                faculityLeaveMasterEntity.getLeaveTo(),
                faculityLeaveMasterEntity.getTotalDays(),
                faculityLeaveMasterEntity.getLeaveType(),
                faculityLeaveMasterEntity.getDescription(),
                faculityLeaveMasterEntity.getPurpose(),
                faculityLeaveMasterEntity.getReason(),
                faculityLeaveMasterEntity.getLeaveCategory(),
                faculityLeaveMasterEntity.getReportingManager(),
                faculityLeaveMasterEntity.getCcTo()};
        // firing the query
        super.getJdbcTemplate().update(sql, data);
    }

	@Override
	public byte[] findPhotoByEmpName(String name) {
		String query = "select * from emp_db where name='" + name + "'";
		FaculityLeaveMasterEntity faculityLeaveMasterEntity = new FaculityLeaveMasterEntity();
		try {
			faculityLeaveMasterEntity = (FaculityLeaveMasterEntity) super
					.getJdbcTemplate().queryForObject(
							query,
							new BeanPropertyRowMapper(
									FaculityLeaveMasterEntity.class));
		} catch (EmptyResultDataAccessException exception) {
			exception.printStackTrace();
		}
		return faculityLeaveMasterEntity.getImage();

	}

	@Override
	public String enterLeaveHistory(FaculityLeaveMasterVO fl) {

		String query = "insert into emp_leave_history (empNo,deptt,leaveType,ldateFrom,ldateTo,totalDays,purpose,addressTelNoLeave,empName,doe,dom,description,approvedBy,leaveMeeting,leaveCategory,lstatus) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object data[] = new Object[] { fl.getEmpNo(), fl.getDepartment(),
				fl.getLeaveType(), fl.getLeaveFrom(), fl.getLeaveTo(),
				fl.getTotalDays(), fl.getPurpose(), fl.getAddress()+"  mobile:"+fl.getMobile(),
				fl.getName(), new Date(), new Date(), fl.getDescription(),"NA",
				fl.getLeaveMeeting(), fl.getLeaveCategory(),"PENDING"};
		super.getJdbcTemplate().update(query, data);
		return "success";

	}

	@Override
	public List<FaculityLeaveMasterEntity> findAllLeaveHistory() {
		String query = "select e.empNo,e.ldateFrom as leaveFrom,e.ldateTo as leaveTo,e.empName as name,e.deptt as department,e.lstatus,e.leaveType,e.totalDays,e.doe, em.designation from emp_leave_history as e,emp_db as em where e.empNo=em.id order by e.doe desc";

		List<FaculityLeaveMasterEntity> facultyLeaveHistories = super
				.getJdbcTemplate().query(
						query,
						new BeanPropertyRowMapper(
								FaculityLeaveMasterEntity.class));
		return facultyLeaveHistories;
	}

	@Override
	public List<FaculityLeaveMasterEntity> findAllEmpDb() {
		String query = "select e.id as empNo,e.name,e.designation,e.department,e.type,e.doe,e.dom,e.description,e.type as leaveType,e.category as leaveCategory,e.paddress as address from emp_db as e";
		List<FaculityLeaveMasterEntity> allEmpDb = super.getJdbcTemplate()
				.query(query,
						new BeanPropertyRowMapper(
								FaculityLeaveMasterEntity.class));
		return allEmpDb;
	}

	@Override
	public String deleteLeaveHistory(String name, String date) {
		String query = "delete from emp_leave_history where empNo=? and ldateFrom=?";
		Object data[] = new Object[] { name, date };
		super.getJdbcTemplate().update(query, data);
		return "deleted";
	}

	@Override
	public String addEmployeeManulAttendance(
			ManualAttendanceEntity manualAttendanceEntity) {

		/*String intime = manualAttendanceEntity.getIntime();
		String intimeTokens[] = intime.split(":");
		Time wintime = new Time(Integer.parseInt(intimeTokens[0]),
				Integer.parseInt(intimeTokens[1]), 0);

		String outtime=manualAttendanceEntity.getOuttime();
		String outtimeTokens[] = outtime.split(":");
		Time wouttime = new Time(Integer.parseInt(outtimeTokens[0]),
				Integer.parseInt(outtimeTokens[1]), 0);


		System.out.println(manualAttendanceEntity);
		// match this fid is valid or not
		Time curretTime = DateUtils.getCurrentTime();

		// Computing in status for employee.
		InOutTimeEntity inOutTimeVO = getJdbcTemplate().queryForObject(
				FaculityQuery.SELECT_CURRENT_ORGANIZATION_TIME,
				new BeanPropertyRowMapper<InOutTimeEntity>(
						InOutTimeEntity.class));

		String inStatus = BaoConstants.NORMAL_STATUS;
		if (wintime.getTime() > inOutTimeVO.getLatein().getTime()) {
			inStatus = BaoConstants.LATE_IN_STATUS;
		}

		String outStatus = BaoConstants.NORMAL_STATUS;
		if (wouttime.getTime() <= inOutTimeVO.getLatein().getTime()) {
			outStatus = BaoConstants.EARLY_OUT_STATUS;
		}

		String status=BaoConstants.NORMAL_STATUS;
		//computing the final status
		if(inStatus.equals(BaoConstants.LATE_IN_STATUS) && outStatus.equals(BaoConstants.EARLY_OUT_STATUS)){
			status=BaoConstants.LATE_IN_STATUS+"-"+BaoConstants.EARLY_OUT_STATUS;
		}else if(inStatus.equals(BaoConstants.NORMAL_STATUS) && outStatus.equals(BaoConstants.EARLY_OUT_STATUS)){
			status=BaoConstants.EARLY_OUT_STATUS;
		} else if(inStatus.equals(BaoConstants.LATE_IN_STATUS) && outStatus.equals(BaoConstants.NORMAL_STATUS)){
			status=BaoConstants.LATE_IN_STATUS;
		}

		try {
		// Here we have two use cases
		// this is entry first entry for today for the employee
		Object[] qdata = new Object[] { manualAttendanceEntity.getEid(),
				manualAttendanceEntity.getCdate(),
				wintime,wouttime,status,
				DateUtils.getCurrentDateInSQLFormat(), inStatus,outStatus,"MANUAL",
				"FULLDAY", "YES", "Welcome sir", "NotSent", "admin" };
			getJdbcTemplate()
					.update("insert into faculity_att_tab (fid,cdate,intime,outtime,status,dom,intimestatus,outtimestatus,attmode,detail,present,description,alert,entryby) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
							qdata);
		}catch(Exception ex){
			return "NOTDONE";
		}*/
		return "DONE";
	}

	@Override
	public List<FaculityLeaveMasterEntity> findAllPendingLeaveHistory() {
		String query = "select e.empNo,e.ldateFrom as leaveFrom,e.ldateTo as leaveTo,e.empName as name,e.deptt as department,e.lstatus,e.leaveType,e.totalDays,e.doe, em.designation from emp_leave_history as e,emp_db as em where e.empNo=em.id and e.lstatus='RM-APPROVED' order by e.doe desc";
		List<FaculityLeaveMasterEntity> facultyLeaveHistories = super
				.getJdbcTemplate().query(
						query,
						new BeanPropertyRowMapper(
								FaculityLeaveMasterEntity.class));
		return facultyLeaveHistories;
	}





	@Override
	public void updateLeaveHistory(String empNo, String date, String lstatus) {
		String query="update emp_leave_history set lstatus=? where empNo=? and ldateFrom=?";
		Object data[] = new Object[] {lstatus,empNo,date};
		super.getJdbcTemplate().update(query, data);
	}

	@Override
	public List<FaculityLeaveMasterEntity> getReportingManagerList() {
		String query="select elt.eid as empNo,elt.role,edb.name from faculity_login_tbl as elt,emp_db as edb where elt.role='user' and id=elt.eid";
		List<FaculityLeaveMasterEntity> entities=super.getJdbcTemplate().query(
				query,
				new BeanPropertyRowMapper(
						FaculityLeaveMasterEntity.class));
		return entities;
	}

	@Override
	public List<FaculityLeaveMasterEntity> getCCToList() {
		String query="select elt.eid as empNo,elt.role,edb.name from faculity_login_tbl as elt,emp_db as edb where elt.role='user' and id=elt.eid";
		List<FaculityLeaveMasterEntity> ccToList=super.getJdbcTemplate().query(
				query,
				new BeanPropertyRowMapper(
						FaculityLeaveMasterEntity.class));
		return ccToList;
	}

	@Override
	public String enterRmLeaveHistory(
			FaculityLeaveMasterVO fl) {
		String query = "insert into emp_leave_history (empNo,deptt,leaveType,ldateFrom,ldateTo,totalDays,purpose,addressTelNoLeave,empName,doe,dom,description,approvedBy,leaveMeeting,leaveCategory,lstatus) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object data[] = new Object[] { fl.getEmpNo(), fl.getDepartment(),
				fl.getLeaveType(), fl.getLeaveFrom(), fl.getLeaveTo(),
				fl.getTotalDays(), fl.getPurpose(), fl.getAddress()+"  mobile:"+fl.getMobile(),
				fl.getName(), new Date(), new Date(), fl.getDescription(),"NA",
				fl.getLeaveMeeting(), fl.getLeaveCategory(),"RM-PENDING"};
		super.getJdbcTemplate().update(query, data);
		return "success";

	}

	@Override
	public List<FaculityLeaveMasterEntity> findAllRmPendingLeaveHistory() {
		String query = "select e.empNo,e.ldateFrom as leaveFrom,e.ldateTo as leaveTo,e.empName as name,e.deptt as department,e.lstatus,e.leaveType,e.totalDays,e.doe, em.designation from emp_leave_history as e,emp_db as em where e.empNo=em.id and e.lstatus='RM-PENDING' order by e.doe desc";
		List<FaculityLeaveMasterEntity> facultyLeaveHistories = super
				.getJdbcTemplate().query(
						query,
						new BeanPropertyRowMapper(
								FaculityLeaveMasterEntity.class));
		return facultyLeaveHistories;
	}

}