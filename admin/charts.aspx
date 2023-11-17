<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="charts.aspx.cs" Inherits="Hiring.admin.charts" %>

<style>
    :root {
  --size: 180px;
  --bord: 10px;
}

.chart {
  width: var(--size);
  height: var(--size);
  margin: 1em auto;
  border-radius: 50%;
  background-image: conic-gradient(lightseagreen var(--value), lightgrey var(--value));
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}

.chart::after {
  content: "";
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: calc(100% - var(--bord));
  height: calc(100% - var(--bord));
  background: white;
  border-radius: inherit;
}

p {
  position: relative;
  z-index: 1;
  font-size: 2em;
}
</style>
<div class="col-sm-12">
    <div class="card">
        <div class="card-header">
            <h5>Nombres des Candidatures / Offre</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table-striped table col-sm-12">
                    <thead>
                        <tr>
                            <th style="width:75%;padding-bottom:15px;" scope="row">Offres</th>
                            <th style="padding-bottom:15px;width:10%;">Nombre de candidatures</th>
                            <th style="padding-bottom:15px;width:15%;">Jours restants</th>
                        </tr>
                    </thead>
                    <tbody id="candidatureOffre" runat="server">
                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="acceptedPerOffre" runat="server" class="col-sm-12">
        <h5>Candidats Acceptés / Offre</h5>
    </div>
</div>