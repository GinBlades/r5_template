declare var $: any;

let initialize: () => void = () => {
    console.log("Wubba lubba dub dub");
    $(".datetimepicker").datetimepicker({
        format: "YYYY-MM-DD hh:mm"
    });
};
