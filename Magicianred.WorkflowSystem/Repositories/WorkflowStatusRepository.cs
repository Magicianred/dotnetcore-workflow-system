using Magicianred.WorkflowSystem.Infrastructures.Models;
using Magicianred.WorkflowSystem.Infrastructures.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace Magicianred.WorkflowSystem.Repositories
{
    /// <summary>
    /// Repository for Workflow status
    /// </summary>
    public class WorkflowStatusRepository : IWorkflowStatusRepository
    {
        private IList<IWorkflowStatus> _store;

        /// <summary>
        /// Costructor
        /// </summary>
        /// <param name="context"></param>
        public WorkflowStatusRepository(IContext context)
        {
            _store = context.WorkflowStatuses.ToList();
        }

        /// <summary>
        /// Insert a Workflow status in the store
        /// </summary>
        /// <param name="workflowStatus"></param>
        /// <returns>Id of the new Workflow status inserted</returns>
        public int Add(IWorkflowStatus workflowStatus)
        {
            if (_store != null)
            {
                _store = new List<IWorkflowStatus>();
            }

            var newId = this.getNewId();
            workflowStatus.Id = newId;

            _store.Add(workflowStatus);
            return newId;
        }

        /// <summary>
        /// Delete a workflow status by id
        /// </summary>
        /// <param name="id">id workflow status to delete</param>
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
        /// Delete a workflow status
        /// </summary>
        /// <param name="toDelete">workflow status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Delete(IWorkflowStatus toDelete)
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
        /// Retrive all workflows statuses
        /// </summary>
        /// <returns>All workflow statuses in the store</returns>
        public IQueryable<IWorkflowStatus> GetAll()
        {
            if (_store != null)
            {
                return _store.AsQueryable();
            }
            return null;
        }

        /// <summary>
        /// Retrive a Workflow status by Id
        /// </summary>
        /// <param name="id">id of the workflow</param>
        /// <returns>a workflow</returns>
        public IWorkflowStatus GetById(int id)
        {
            if (_store != null)
            {
                return _store.Where(x => x.Id == id).FirstOrDefault();
            }
            return null;
        }

        /// <summary>
        /// Update a Workflow status in the store
        /// </summary>
        /// <param name="workflowStatus">A workflow status to update</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Update(IWorkflowStatus workflowStatus)
        {
            if (_store != null)
            {
                var toUpdate = _store.Where(x => x.Id == workflowStatus.Id).FirstOrDefault();
                if (toUpdate != null)
                {
                    toUpdate.Name = workflowStatus.Name;
                    toUpdate.Description = workflowStatus.Description;
                    toUpdate.WorkflowId = workflowStatus.WorkflowId;
                    toUpdate.TypeId = workflowStatus.TypeId;
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
