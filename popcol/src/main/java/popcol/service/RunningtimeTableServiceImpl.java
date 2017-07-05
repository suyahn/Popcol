package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.RunningtimeTableDao;
import popcol.model.RunningtimeTable;

@Service
public class RunningtimeTableServiceImpl implements RunningtimeTableService {
	@Autowired
	private RunningtimeTableDao rtd;

	@Override
	public List<RunningtimeTable> runningtimeTableList() {
		return rtd.runningtimeTableList();
	}
	/*규랑*/
	@Override
	public List<RunningtimeTable> adminTTList(int startRow, int endRow) {

		return rtd.adminTTList(startRow, endRow);
	}

	@Override
	public int getTotal1() {

		return rtd.getTotal1();
	}

	@Override
	public int getTotal2(RunningtimeTable runningtimeTable) {

		return rtd.getTotal2(runningtimeTable);
	}
	@Override
	public int adminTTInsert(RunningtimeTable runningtimeTable) {
		
		return rtd.adminTTInsert(runningtimeTable);
	}
}
