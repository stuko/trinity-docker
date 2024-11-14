package com.stuko.kronos.container.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.stuko.kronos.impl.AbstractContainerImpl;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class DecisionContainer extends AbstractContainerImpl {

	static Logger logger = LoggerFactory.getLogger(DecisionContainer.class);
	// ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);

	@Override
	public void start() {
		/*
		try{List<Map<String, Object>> mapList = this.executeSimpleSQLMapper("BEAN NAME", null, false);}
		catch(Exception e){logger.error(e.toString());}

		executor.scheduleAtFixedRate(() -> {
			try {
				getThreadPoolManager().executeThread(() -> {
			        });
			}catch(Exception e){
				logger.error(e.toString());
			}
		}, 0, 1000, TimeUnit.SECONDS);
		 */
	}

	@Override
	public void stop() {
		/*
		try{executor.shutdownNow();}
		catch(Exception e){logger.error(e.toString());}
		*/
	}
	
	@Override
	public Map<String, Object> execute(Map<String, Object> parameter) throws Exception {
		return parameter;
	}
	
}
