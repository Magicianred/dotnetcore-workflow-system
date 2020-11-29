using Magicianred.WorkflowSystem.Infrastructures.Handlers;
using Magicianred.WorkflowSystem.Infrastructures.Models;
using Magicianred.WorkflowSystem.Infrastructures.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Magicianred.WorkflowSystem.Handlers
{
    /// <summary>
    /// Handler for workflow
    /// </summary>
    public class WorkflowHandler : IWorkflowHandler
    {
        private readonly IContext _context;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWorkflowRepository _workflowRepository;
        private readonly IWorkflowStatusRepository _workflowStatusRepository;
        private readonly IWorkflowNextStatusRepository _workflowNextStatusRepository;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context">Context to use</param>
        /// <param name="unitOfWork">Unit of work to use</param>
        /// <param name="workflowRepository">Workflow repository to use</param>
        public WorkflowHandler(IContext context, IUnitOfWork unitOfWork, IWorkflowRepository workflowRepository, 
                    IWorkflowStatusRepository workflowStatusRepository, IWorkflowNextStatusRepository workflowNextStatusRepository)
        {
            _context = context;
            _unitOfWork = unitOfWork;
            _workflowRepository = workflowRepository;
            _workflowStatusRepository = workflowStatusRepository;
            _workflowNextStatusRepository = workflowNextStatusRepository;
        }

        /// <summary>
        /// Setup for Workflow
        /// </summary>
        /// <returns>All workflow for the application</returns>
        public IList<IWorkflow> Configure()
        {
            var list = _workflowRepository.GetAll();
            return list.ToList();
        }

        /// <summary>
        /// Get status of the specific entity
        /// </summary>
        /// <param name="idWorkflow">Workflow id</param>
        /// <param name="idEntity">Entity id</param>
        /// <returns>Actual state of the entity</returns>
        public IWorkflowStatus GetActualStateEntity(int idWorkflow, int idEntity)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Retrieve all nextStatuses for entity and for status
        /// </summary>
        /// <param name="idStatus">Actual status id</param>
        /// <returns>All possible next status with all requirements for each status</returns>
        public IList<IWorkflowNextStatus> GetNextStatusesEntity(int idStatus)
        {
            return _workflowNextStatusRepository.GetAllByInitialStatusId(idStatus).ToList();
        }

        /// <summary>
        /// Retrieve all nextStatuses for entity, for status and for a list of specific user roles
        /// </summary>
        /// <param name="idStatus">Actual status id</param>
        /// <param name="userRolesIds">List of roles for the current user</param>
        /// <returns>All possible next status with all requirements for each status</returns>
        public IList<IWorkflowNextStatus> GetNextStatusesEntity(int idStatus, List<int> userRolesIds)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Set status for entity and active all Actions relatives
        /// </summary>
        /// <param name="idEntity"></param>
        /// <param name="idNewStatus"></param>
        /// <returns>Boolean of success</returns>
        public bool SetStatus(int idEntity, int idNewStatus)
        {
            throw new NotImplementedException();
        }
    }
}
