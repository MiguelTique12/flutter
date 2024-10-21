package com.ProyectoGT.CodeByte.Utils;

import java.util.Arrays;
import java.util.List;

public class GlobalConstants {
	/**
	 * Lista de campos excluidos en operaciones de serialización.
	 * La lista contiene los nombres de los campos que deben excluirse.
	 */
	public static final List<String> EXCLUDED_FIELDS = Arrays.asList("id");
}
