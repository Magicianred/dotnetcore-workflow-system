﻿using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Models
{
    public partial class EntityType : IEntityType
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool HasSoftDeletion { get; set; }
    }
}
