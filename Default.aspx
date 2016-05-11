<%@ Page Title="Horizontal Aggregation in Sql" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 810px; height: 1030px;">
        <div style="width: 620px; height: auto; float: left; border-right-color: #808080; border-right-style: outset; border-right-width: medium; padding-right: 10px;">
            <h2>Introduction</h2>

            <h3>Abstract</h3>
            <p style="text-align: justify">
                Preparing a data set for analysis is generally the most time consuming task in a data mining project, requiring many
complex SQL queries, joining tables, and aggregating columns. Existing SQL aggregations have limitations to prepare data sets
because they return one column per aggregated group. In general, a significant manual effort is required to build data sets, where a
horizontal layout is required. We propose simple, yet powerful, methods to generate SQL code to return aggregated columns in a
horizontal tabular layout, returning a set of numbers instead of one number per row. This new class of functions is called horizontal
aggregations. Horizontal aggregations build data sets with a horizontal denormalized layout (e.g., point-dimension, observationvariable,
instance-feature), which is the standard layout required by most data mining algorithms. We propose three fundamental
methods to evaluate horizontal aggregations: CASE: Exploiting the programming CASE construct; SPJ: Based on standard relational
algebra operators (SPJ queries); PIVOT: Using the PIVOT operator, which is offered by some DBMSs. Experiments with large tables
compare the proposed query evaluation methods. Our CASE method has similar speed to the PIVOT operator and it is much faster
than the SPJ method. In general, the CASE and PIVOT methods exhibit linear scalability, whereas the SPJ method does not.
            </p>

            <h3>Advantages</h3>
            <p style="text-align: justify">
                Our proposed horizontal aggregations provide several
unique features and advantages. 
    <ul>
        <li style="text-align: justify">They represent a
template to generate SQL code from a data mining tool. Such
SQL code automates writing SQL queries, optimizing them,
and testing them for correctness.This SQL code reduces
manual work in the data preparation phase in a data mining
project.</li>
        <li style="text-align: justify">Since SQL code is automatically generated it
is likely to be more efficient than SQL code written by an end
user. For instance, a person who does not know SQL well or
someone who is not familiar with the database schema (e.g.,
a data mining practitioner). Therefore, data sets can be
created in less time.</li>
        <li style="text-align: justify">The data set can be created entirely
inside the DBMS. In modern database environments, it is
common to export denormalized data sets to be further
cleaned and transformed outside a DBMS in external tools
(e.g., statistical packages). Unfortunately, exporting large
tables outside a DBMS is slow, creates inconsistent copies of
the same data and compromises database security. Therefore,
we provide a more efficient, better integrated and more
secure solution compared to external data mining tools.</li>
        <li style="text-align: justify">Horizontal aggregations can be used to
generate SQL code from a data mining tool to build data
sets for data mining analysis.
        </li>
    </ul>
            </p>
        </div>
        <div style="width: 170px; height: auto; float: right; border-bottom-color: #808080; border-bottom-style: inset; border-bottom-width: thin;">
            <div style="height: 140px; margin-left: 10px; margin-top: 15px;">
                <asp:ImageButton ID="userloginbtn" runat="server" Height="130px" ImageUrl="~/img/userlogin.jpg" Width="150px" OnClick="userloginbtn_Click" />
            </div>
            <div style="height: 140px; margin-left: 10px; margin-bottom: 10px;">
                <asp:ImageButton ID="adminbtn" runat="server" Height="130px" ImageUrl="~/img/adminlogin.jpeg" Width="150px" OnClick="adminbtn_Click" />
            </div>

        </div>

    </div>

</asp:Content>

