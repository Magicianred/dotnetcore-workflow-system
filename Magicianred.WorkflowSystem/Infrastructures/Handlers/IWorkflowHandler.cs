using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Handlers
{
    /// <summary>
    /// Interface of Workflow handler
    /// </summary>
    public interface IWorkflowHandler
    {
        /// <summary>
        /// Setup for Workflow
        /// </summary>
        /// <returns>All workflow for the application</returns>
        IList<IWorkflow> Configure();

        /// <summary>
        /// Get status of the specific entity
        /// </summary>
        /// <param name="idWorkflow">Workflow id</param>
        /// <param name="idEntity">Entity id</param>
        /// <returns>Actual state of the entity</returns>
        IWorkflowStatus GetActualStateEntity(int idWorkflow, int idEntity);

        /// <summary>
        /// Retrieve all nextStatuses for entity and for status
        /// </summary>
        /// <param name="idStatus">Actual status id</param>
        /// <returns>All possible next status with all requirements for each status</returns>
        IList<IWorkflowNextStatus> GetNextStatusesEntity(int idStatus);

        /// <summary>
        /// Retrieve all nextStatuses for entity, for status and for a list of specific user roles
        /// </summary>
        /// <param name="idStatus">Actual status id</param>
        /// <param name="userRolesIds">List of roles for the current user</param>
        /// <returns>All possible next status with all requirements for each status</returns>
        IList<IWorkflowNextStatus> GetNextStatusesEntity(int idStatus, List<int> userRolesIds);

        /// <summary>
        /// Set status for entity and active all Actions relatives
        /// </summary>
        /// <param name="idEntity"></param>
        /// <param name="idNewStatus"></param>
        /// <returns>Boolean of success</returns>
        bool SetStatus(int idEntity, int idNewStatus);
    }
}
