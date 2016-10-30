declare var $: any;

let initialize: () => void = () => {
    $(".datetimepicker").datetimepicker({
        format: "YYYY-MM-DD hh:mm"
    });
};
