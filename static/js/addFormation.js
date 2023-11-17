function addFormation() {
    A = document.getElementById('formations');
    index = A.childElementCount + 1;
    var blocHTML = '<fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;" id="fdd1"><legend class="pl-2 pr-2" style="width: auto;"><button class="btn btn-danger p-2 btn-sm" type="button" onclick="deleteFormation(this.parentNode)">Supprimer</button></legend><div class="row"><p class="col-sm-12"><input placeholder="Formation" onchange="textChange(this)"></p></div><div class="row"><p class="col-sm-6"></p><div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable"><input style="border-radius: 0%;" type="text" placeholder="Date Debut" class="form-control gj-textbox-md" id="datedebut'+index+'" required="" onchange="textChange(this)" data-type="datepicker" data-guid="cb901b9c-9e8d-0b7c-1b7c-ab1f56206f17" data-datepicker="true" role="input"><i class="gj-icon" role="right-icon">event</i></div><p></p><p class="col-sm-6"></p><div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable"><input style="border-radius: 0%;" type="text" placeholder="Date Fin" class="form-control gj-textbox-md" id="datefin'+index+'" required="" onchange="textChange(this)" data-type="datepicker" data-guid="74406600-ec02-c8ba-bb69-239facf4e3d9" data-datepicker="true" role="input"><i class="gj-icon" role="right-icon">event</i></div><p></p></div><div class="row"><p class="col-sm-6"><label>Diplôme obtenu</label><select class="col pt-0 mt-0" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" id="exampleFormControlSelect1"><option value="DUT">DUT</option><option value="LF">Licence fondamentale</option><option value="LST">Licence sciences et techniques</option><option value="LP">Licence professionnelle</option><option value="DENCG">Diplôme de L"ENCG</option><option value="Ingenieur">Diplôme d"ingénieur</option><option value="MasterRecherche">Master recherche</option><option value="MasterSpecialise">Master spécialisé</option><option value="Doctorat">Doctorat</option><option value="autre">Autre</option></select></p><p class="col-sm-6"><label>Filière</label><select class="col pt-0 mt-0" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" id="exampleFormControlSelect1"><option value="DUT">DUT</option><option value="LF">Licence fondamentale</option><option value="LST">Licence sciences et techniques</option><option value="LP">Licence professionnelle</option><option value="DENCG">Diplôme de L"ENCG</option><option value="Ingenieur">Diplôme d"ingénieur</option><option value="MasterRecherche">Master recherche</option><option value="MasterSpecialise">Master spécialisé</option><option value="Doctorat">Doctorat</option><option value="autre">Autre</option></select></p></div>';
    A.innerHTML += blocHTML;

    B = 'datedebut'+index;
    C = 'datefin'+index;


    $(function () {
        $(B).datepicker({
            viewMode: 'years',
            format: 'mm/yyyy'
        });
    });

    $(function () {
        $(C).datepicker({
            viewMode: 'years',
            format: 'mm/yyyy'
        });
    });
}