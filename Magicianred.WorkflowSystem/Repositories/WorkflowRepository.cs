using Magicianred.WorkflowSystem.Infrastructures.Models;
using Magicianred.WorkflowSystem.Infrastructures.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magicianred.WorkflowSystem.Repositories
{
    /// <summary>
    /// Repository for the workflow
    /// </summary>
    public class WorkflowRepository : IWorkflowRepository
    {
        private IList<IWorkflow> _store;

        /// <summary>
        /// Costructor
        /// </summary>
        /// <param name="context"></param>
        public WorkflowRepository(IContext context)
        {
            _store = context.Workflows;
        }

        /// <summary>
        /// Delete a workflow from the repository by id
        /// </summary>
        /// <param name="id">workflow id to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Delete(int id)
        {
            if(_store != null)
            {
                var toDelete = _store.Where(x => x.Id == id).FirstOrDefault();
                if(toDelete != null)
                {
                    _store.Remove(toDelete);
                }
            }
            return true;
        }

        /// <summary>
        /// Delete a workflow from the repository
        /// </summary>
        /// <param name="toDelete">Workflow item to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Delete(IWorkflow toDelete)
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
        /// Retrieve all workflow in the repository
        /// </summary>
        /// <returns>Return all workflows</returns>
        public IQueryable<IWorkflow> GetAll()
        {
            if (_store != null)
            {
                return _store.AsQueryable();
            }
            return null;
        }

        /// <summary>
        /// Obtain a workflow by id
        /// </summary>
        /// <param name="id">id workflow to obtain</param>
        /// <returns>A workflow from the repository</returns>
        public IWorkflow GetById(int id)
        {
            if (_store != null)
            {
                return _store.Where(x => x.Id == id).FirstOrDefault();
            }
            return null;
        }

        /// <summary>
        /// Insert a new workflow item
        /// </summary>
        /// <param name="workflow">workflow data to insert</param>
        /// <returns>True if succed, false otherwise</returns>
        public int Add(IWorkflow workflow)
        {
            if (_store != null)
            {
                _store = new List<IWorkflow>();
            }

            var newId = this.getNewId();
            workflow.Id = newId;

            _store.Add(workflow);
            return newId;
        }

        /// <summary>
        /// Update a workflow item
        /// </summary>
        /// <param name="workflow">workflow data to update</param>
        /// <returns>True if succed, false otherwise</returns>
        public bool Update(IWorkflow workflow)
        {
            if (_store != null)
            {
                var toUpdate = _store.Where(x => x.Id == workflow.Id).FirstOrDefault();
                if (toUpdate != null)
                {
                    toUpdate.EntityTypeId = workflow.EntityTypeId;
                    toUpdate.TypeId = workflow.TypeId;
                    return true;
                }
            }
            return false;
        }


        #region Private methods

        /// <summary>
        /// Obtain a new progressive
        /// </summary>
        /// <returns></returns>
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
