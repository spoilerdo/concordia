export default {
  beforeCreate(event) {
    const today = new Date().getUTCFullYear();
    const { Occasion, Purchase_Date, Purchase_Value } = event.params.data;

    if (Occasion && Occasion > 0) {
      event.params.data.Computed_Insurance_Value = Occasion;
    } else if (Purchase_Date && Purchase_Value) {
      const purchaseYear = Purchase_Date.split("-", 1)[0];
      if (purchaseYear === today) {
        event.params.data.Computed_Insurance_Value = Purchase_Value;
      } else if (today - 1 === purchaseYear) {
        event.params.data.Computed_Insurance_Value = Purchase_Value * 0.9;
      } else if (today - 2 === purchaseYear) {
        event.params.data.Computed_Insurance_Value = Purchase_Value * 0.85;
      } else if (today - 3 === purchaseYear) {
        event.params.data.Computed_Insurance_Value = Purchase_Value * 0.8;
      } else if (today - 6 <= purchaseYear) {
        event.params.data.Computed_Insurance_Value = Purchase_Value * 0.75;
      } else if (today - 10 <= purchaseYear) {
        event.params.data.Computed_Insurance_Value = Purchase_Value * 0.7;
      } else if (today - 10 >= purchaseYear) {
        event.params.data.Computed_Insurance_Value = Purchase_Value * 0.65;
      }
    }
  },
};
