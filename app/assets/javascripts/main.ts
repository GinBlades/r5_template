declare var $: any;
declare var tinyMCE: any;

let initialize: () => void = () => {
    $(".datetimepicker").datetimepicker({
        format: "YYYY-MM-DD hh:mm"
    });

    tinyMCE.init({
        selector: "textarea.tinymce"
    });
};

let cleanup: () => void = () => {
    if (tinyMCE) {
        tinyMCE.remove();
    }
};
