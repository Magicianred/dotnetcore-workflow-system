using Magicianred.WorkflowSystem.Infrastructures.Models;
using Magicianred.WorkflowSystem.Models;
using Microsoft.Extensions.DependencyInjection;

namespace Magicianred.WorkflowSystem.Extensions.DependencyInjection
{
    public static class IServiceCollectionExtension
    {
        public static IServiceCollection AddWorkflowSystem(this IServiceCollection services)
        {
            services.AddTransient<IWorkflow, Workflow>();
            services.AddTransient<IWorkflowType, WorkflowType>();

            services.AddTransient<IWorkflowStatus, WorkflowStatus>();
            services.AddTransient<IWorkflowStatusType, WorkflowStatusType>();

            services.AddTransient<IWorkflowNextStatus, WorkflowNextStatus>();

            services.AddTransient<IWorkflowAction, WorkflowAction>();
            services.AddTransient<IWorkflowActionType, WorkflowActionType>();

            services.AddTransient<IWorkflowRequirement, WorkflowRequirement>();
            services.AddTransient<IWorkflowRequirementType, WorkflowRequirementType>();

            services.AddTransient<IEntityType, EntityType>();

            return services;
        }
    }
}