package com.web.icook.view;
  
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.web.icook.model.ProductBean;

public class AllProductsExcelView extends AbstractXlsView  {
	
	Sheet sheet;	
	String sheetName = "sheet 1";
	HSSFFont chiTextFont = null;
	HSSFFont engTextFont = null;
	HSSFFont titleFont = null;
	int rowCount = 0;
	int colCount = 0;
	short fontSize = 16;
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("===buildExcelDocument  IN==");
		rowCount = 0;
		colCount = 0;
		setSheetProperties(workbook);
        createExcelHeaders(workbook);
		populateExcelCells(model, workbook);

		System.out.println("===buildExcelDocument OUT==");
	}

	private void setSheetProperties(Workbook workbook) {
		System.out.println("===setSheetProperties  IN==");
		// 由 workbook產生Sheet物件
		sheet = workbook.createSheet(sheetName);
		// 由 workbook產生HSSFont物件
		chiTextFont= (HSSFFont)workbook.createFont();
		// 設定字型名稱
		chiTextFont.setFontName("新細明體");
		// 設定字號		
		chiTextFont.setFontHeightInPoints(fontSize);
		//--------------------------------------
		// 由 workbook產生HSSFont物件
		engTextFont= (HSSFFont)workbook.createFont();
		// 設定字型名稱
		engTextFont.setFontName("Arial");
		// 設定字號
		engTextFont.setFontHeightInPoints(fontSize);
		
		
		titleFont = chiTextFont;
		System.out.println("===setSheetProperties OUT==");
	}

	private void populateExcelCells(Map<String, Object> model, Workbook workbook) {
		Sheet sheet = workbook.getSheet(sheetName);
		System.out.println("===populateExcelCells  IN==");
		HSSFCellStyle styleCenter = (HSSFCellStyle)workbook.createCellStyle();
		styleCenter.setFont(engTextFont);
		
		styleCenter.setFillForegroundColor(IndexedColors.WHITE.index);
		styleCenter.setFillPattern(CellStyle.SOLID_FOREGROUND);
		styleCenter.setAlignment(CellStyle.ALIGN_CENTER);
		
		styleCenter.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		styleCenter.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		styleCenter.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		styleCenter.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
		
		CellStyle styleName = workbook.createCellStyle();
		styleName.setFillForegroundColor(IndexedColors.WHITE.index);
		styleName.setFillPattern(CellStyle.SOLID_FOREGROUND);
		styleName.setAlignment(CellStyle.ALIGN_CENTER);
		styleName.setFont(chiTextFont);
		
		styleName.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		styleName.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		styleName.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		styleName.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
		
		
		
		
		CellStyle styleRight = workbook.createCellStyle();
		styleRight.setFillForegroundColor(IndexedColors.WHITE.index);
		styleRight.setFillPattern(CellStyle.SOLID_FOREGROUND);
		styleRight.setAlignment(CellStyle.ALIGN_RIGHT);
		styleRight.setFont(engTextFont);
		
		styleRight.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		styleRight.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		styleRight.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		styleRight.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);

		
        HSSFCellStyle styleDate = (HSSFCellStyle)workbook.createCellStyle();
		
		CreationHelper createHelper = workbook.getCreationHelper();
		styleDate.setDataFormat(
		    createHelper.createDataFormat().getFormat("yyyy/mm/dd"));
		styleDate.setFont(engTextFont);
		styleDate.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		styleDate.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		styleDate.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		styleDate.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
		styleDate.setAlignment(CellStyle.ALIGN_CENTER);
		
        List<ProductBean> products = (List<ProductBean>) model.get("allProducts");
        
		Set<String> set = model.keySet();
		Row row = null;
		Cell cell = null;
		for(ProductBean m : products) {
			colCount = 0;
			row = sheet.createRow(rowCount++);
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getProduct_id());
			
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleName);
			cell.setCellValue(m.getName());
			
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getCategoriesbean().getCategorybean().getName()+" / "+m.getCategoriesbean().getName());			
			
			
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getColor());			
			
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getDescription());			
			
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getUnit_size());			
			
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getStock());			
			if(m.getPrice()!=null) {
			cell = row.createCell(colCount++);
			cell.setCellStyle(styleCenter);
			cell.setCellValue(m.getPrice());			
			}

			
//			cell = row.createCell(colCount++);
//			cell.setCellStyle(styleRight);
//			DecimalFormat  df = new DecimalFormat("#,###,###.00");
//			cell.setCellValue(df.format(m.getBalance()));
			
//			cell = row.createCell(colCount++);
//			cell.setCellStyle(styleDate);
//			cell.setCellValue(m.getBirthday());
		}
		int columnCount = sheet.getRow(0).getLastCellNum();
		for (int i=0; i < columnCount; i++){
			sheet.autoSizeColumn(i);
		}
		
		System.out.println("===populateExcelCells OUT==");
	}

	private void createExcelHeaders(Workbook workbook) {
		System.out.println("===createExcelHeaders IN==");
		String[] labels = {"編號", "名稱","種類","顏色","描述","單位","庫存","價格"};
		
		
		CellStyle titleStyle = workbook.createCellStyle();
		
		titleStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
		titleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		titleStyle.setAlignment(CellStyle.ALIGN_CENTER);
		titleStyle.setFont(titleFont);
		
		titleStyle.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		titleStyle.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		titleStyle.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		titleStyle.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
		
		
		// 建立Excel表的標頭
		Row row = null;
		Cell cell = null;
		row = sheet.createRow(rowCount++);
		colCount = 0;
		// Create header cells
		for(int n =0; n < labels.length; n++) {
			cell = row.createCell(colCount++);
			cell.setCellStyle(titleStyle);
			cell.setCellValue(labels[n]);
		}
		
		System.out.println("===createExcelHeaders OUT==");
	}

}