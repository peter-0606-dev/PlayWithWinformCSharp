﻿using BusinessObject;
using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace SalesWinApp
{
    public partial class frmOrdersHistory : Form
    {
        public IOrderRepository orderRepository = new OrderRepository();
        public MemberObject MemberInfo { get; set; }
        BindingSource source = new BindingSource();
        public frmOrdersHistory()
        {
            InitializeComponent();
            //orderRepository = new OrderRepository();
        }
        private void frmOrdersHistory_Load(object sender, EventArgs e)
        {
            LoadOrderHistoryList(orderRepository.GetOrderByMemberID(MemberInfo.MemberID));
        }
        private void LoadOrderHistoryList(List<OrderHistoryObject> list)
        {
            try
            {
                source.DataSource = list;
                dgvOrderList.DataSource = null;
                dgvOrderList.DataSource = source;
                dgvOrderList.Columns["OrderID"].DisplayIndex = 0;
                dgvOrderList.Columns["MemberID"].DisplayIndex = 1;
                dgvOrderList.Columns["OrderDate"].DisplayIndex = 2;
                dgvOrderList.Columns["RequiredDate"].DisplayIndex = 3;
                dgvOrderList.Columns["ShippedDate"].DisplayIndex = 4;
                dgvOrderList.Columns["Freight"].DisplayIndex = 5;
                dgvOrderList.Columns["Total"].DisplayIndex = 6;

                if (list.Count() == 0)
                {
                    MessageBox.Show("Sorry, you did not buy anything from my store!", "Message", MessageBoxButtons.OK);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load member list", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }
        private void frmMembers_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Are you sure to quit?", "Confirm information", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
            {
                e.Cancel = true;
            }
        }


    }
}
