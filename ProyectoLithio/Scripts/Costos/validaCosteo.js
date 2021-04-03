$('#frmCosteo').validetta({
    showErrorMessages: true, // If you dont want to display error messages set this option false
    /** You can display errors as inline or bubble */
    display: 'bubble', // bubble or inline
    /**
     * Error template class
     * This is the class which will be added to the error message window template.
     * If you want special style, you can change class name as you like with this option.
     * Error message window template : <span class="errorTemplateClass">Error messages will be here !</span>
     */
    errorTemplateClass: 'validetta-bubble',
    /** Class that would be added on every failing validation field */
    errorClass: 'validetta-error',
    /** Same for valid validation */
    validClass: 'validetta-valid', // Same for valid validation
    bubblePosition: 'right', // Bubble position // right / bottom
    bubbleGapLeft: 15, // Right gap of bubble (px unit)
    bubbleGapTop: 0, // Top gap of bubble (px unit)
    /* To enable real-time form control, set this option true. */
    realTime: true,
    validators: {

    }, // Custom validators stored in this variable
    /** Callback functions */
    onValid: function (event) {
        
    },
    onError: function () { }
});