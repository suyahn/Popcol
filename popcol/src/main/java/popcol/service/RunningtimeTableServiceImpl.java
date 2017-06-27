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
}
