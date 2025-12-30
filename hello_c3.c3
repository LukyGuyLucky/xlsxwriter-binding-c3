/*
 * Example of writing some data to a simple Excel file using libxlsxwriter.
 *
 * Copyright 2014-2018, John McNamara, jmcnamara@cpan.org
 *
 */
alias Lxw_workbook=void;
alias Lxw_worksheet=void;

extern fn Lxw_workbook* workbook_new(ZString) @extern("workbook_new");
extern fn Lxw_worksheet* workbook_add_worksheet(Lxw_workbook*,ZString) @extern("workbook_add_worksheet");

extern fn void worksheet_write_string(Lxw_workbook*,int,int,ZString,ZString) @extern("worksheet_write_string");
extern fn void worksheet_write_number(Lxw_workbook*,int,int,double,ZString) @extern("worksheet_write_number");
extern fn int workbook_close(Lxw_workbook*) @extern("workbook_close");

fn int main() {

    Lxw_workbook  *workbook  = workbook_new("hello_world_c3.xlsx");
    Lxw_worksheet *worksheet = workbook_add_worksheet(workbook, null);

    worksheet_write_string(worksheet, 0, 0, "¡Hola Mundo!Γειά σου Κόσμε!Привет, мир!こんにちは世界！你好世界！नमस्ते दुनिया!👋🌎!", null);
    worksheet_write_number(worksheet, 1, 0, 123.456789, null);

    workbook_close(workbook);

    return 0;
}
