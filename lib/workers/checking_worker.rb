class CheckingWorker < BackgrounDRb::MetaWorker
  set_worker_name :checking_worker
  def create(args = nil)
  end

	def check_al_hosts
		logger.info 'Checking hosts'    
		Host.check_all
	end
end

