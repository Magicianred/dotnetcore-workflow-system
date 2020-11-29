using Magicianred.WorkflowSystem.Infrastructures.Models;
using Magicianred.WorkflowSystem.Infrastructures.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Magicianred.WorkflowSystem.Repositories
{
    /// <summary>
    /// Workflow Next Status Repository
    /// </summary>
    public class WorkflowNextStatusRepository : IWorkflowNextStatusRepository
    {
        private IList<IWorkflowNextStatus> _store;

        /// <summary>
        /// Costructor
        /// </summary>
        /// <param name="context"></param>
        public WorkflowNextStatusRepository(IContext context)
        {
            _store = context.WorkflowNextStatuses.ToList();
        }

        /// <summary>
        /// Insert a Workflow next status in the store
        /// </summary>
        /// <param name="workflowNextStatus"></param>
        /// <returns>Id of the new Workflow next status inserted</returns>
        public int Add(IWorkflowNextStatus workflowNextStatus)
        {
            if (_store != null)
            {
                _store = new List<IWorkflowNextStatus>();
            }

            var newId = this.getNewId();
            workflowNextStatus.Id = newId;

            _store.Add(workflowNextStatus);
            return newId;
        }

        /// <summary>
        /// Delete a workflow next status by id
        /// </summary>
        /// <param name="id">id workflow next status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Delete(int id)
        {
            if (_store != null)
            {
                var toDelete = _store.Where(x => x.Id == id).FirstOrDefault();
                if (toDelete != null)
                {
                    _store.Remove(toDelete);
                }
            }
            return true;
        }

        /// <summary>
        /// Delete a workflow next status
        /// </summary>
        /// <param name="toDelete">workflow next status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Delete(IWorkflowNextStatus toDelete)
        {
            if (_store != null)
            {
                if (toDelete != null)
                {
                    _store.Remove(toDelete);
                }
            }
            return true;
        }

        /// <summary>
        /// Retrive all workflows next statuses
        /// </summary>
        /// <returns>All workflow next statuses in the store</returns>
        public IQueryable<IWorkflowNextStatus> GetAll()
        {
            if (_store != null)
            {
                return _store.AsQueryable();
            }
            return null;
        }

        /// <summary>
        /// Retrive all workflows next statuses by initial status
        /// </summary>
        /// <returns>All workflow next statuses by initial status id in the store</returns>
        public IQueryable<IWorkflowNextStatus> GetAllByInitialStatusId(int initialStatusId)
        {
            if (_store != null)
            {
                return _store.Where(w => w.InitialStatusId == initialStatusId).AsQueryable();
            }
            return null;
        }

        /// <summary>
        /// Retrive a Workflow next status by Id
        /// </summary>
        /// <param name="id">id of the workflow next status</param>
        /// <returns>a workflow</returns>
        public IWorkflowNextStatus GetById(int id)
        {
            if (_store != null)
            {
                return _store.Where(x => x.Id == id).FirstOrDefault();
            }
            return null;
        }

        /// <summary>
        /// Update a Workflow next status in the store
        /// </summary>
        /// <param name="workflowNextStatus">A workflow next status to update</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Update(IWorkflowNextStatus workflowNextStatus)
        {
            if (_store != null)
            {
                var toUpdate = _store.Where(x => x.Id == workflowNextStatus.Id).FirstOrDefault();
                if (toUpdate != null)
                {
                    toUpdate.InitialStatusId = workflowNextStatus.InitialStatusId;
                    toUpdate.NextStatusId = workflowNextStatus.NextStatusId;
                    return true;
                }
            }
            return false;
        }


        #region Private methods

        /// <summary>
        /// Obtain a new progressive
        /// </summary>
        /// <returns>A new identifier</returns>
        private int getNewId()
        {
            if (_store != null)
            {
                return _store.Max(x => x.Id) + 1;
            }
            return 1;
        }
        #endregion
    }
}
