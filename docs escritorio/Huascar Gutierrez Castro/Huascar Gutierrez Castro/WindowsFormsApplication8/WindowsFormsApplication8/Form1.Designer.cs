namespace WindowsFormsApplication8
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.grafica = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.baceptar = new System.Windows.Forms.Button();
            this.tentrada = new System.Windows.Forms.TextBox();
            this.bmedirSP = new System.Windows.Forms.Button();
            this.lresultado = new System.Windows.Forms.TextBox();
            this.Lsalidatiempo = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lista = new System.Windows.Forms.ListBox();
            this.label4 = new System.Windows.Forms.Label();
            this.notificacion = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.grafica)).BeginInit();
            this.SuspendLayout();
            // 
            // grafica
            // 
            chartArea1.Name = "ChartArea1";
            this.grafica.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.grafica.Legends.Add(legend1);
            this.grafica.Location = new System.Drawing.Point(49, 41);
            this.grafica.Name = "grafica";
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series1.Legend = "Legend1";
            series1.Name = "Series1";
            this.grafica.Series.Add(series1);
            this.grafica.Size = new System.Drawing.Size(300, 300);
            this.grafica.TabIndex = 0;
            this.grafica.Text = "chart1";
            this.grafica.Click += new System.EventHandler(this.grafica_Click);
            // 
            // baceptar
            // 
            this.baceptar.Location = new System.Drawing.Point(411, 102);
            this.baceptar.Name = "baceptar";
            this.baceptar.Size = new System.Drawing.Size(75, 23);
            this.baceptar.TabIndex = 1;
            this.baceptar.Text = "aceptar";
            this.baceptar.UseVisualStyleBackColor = true;
            this.baceptar.Click += new System.EventHandler(this.baceptar_Click);
            // 
            // tentrada
            // 
            this.tentrada.Location = new System.Drawing.Point(377, 62);
            this.tentrada.Name = "tentrada";
            this.tentrada.Size = new System.Drawing.Size(136, 20);
            this.tentrada.TabIndex = 2;
            // 
            // bmedirSP
            // 
            this.bmedirSP.Location = new System.Drawing.Point(411, 157);
            this.bmedirSP.Name = "bmedirSP";
            this.bmedirSP.Size = new System.Drawing.Size(75, 23);
            this.bmedirSP.TabIndex = 3;
            this.bmedirSP.Text = "medir";
            this.bmedirSP.UseVisualStyleBackColor = true;
            this.bmedirSP.Click += new System.EventHandler(this.bmedirSP_Click);
            // 
            // lresultado
            // 
            this.lresultado.Location = new System.Drawing.Point(377, 225);
            this.lresultado.Multiline = true;
            this.lresultado.Name = "lresultado";
            this.lresultado.Size = new System.Drawing.Size(136, 103);
            this.lresultado.TabIndex = 4;
            // 
            // Lsalidatiempo
            // 
            this.Lsalidatiempo.Location = new System.Drawing.Point(377, 360);
            this.Lsalidatiempo.Multiline = true;
            this.Lsalidatiempo.Name = "Lsalidatiempo";
            this.Lsalidatiempo.Size = new System.Drawing.Size(136, 63);
            this.Lsalidatiempo.TabIndex = 5;
            this.Lsalidatiempo.TextChanged += new System.EventHandler(this.Lsalidatiempo_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(428, 344);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "tiempo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(428, 209);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "resultado";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(428, 41);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(28, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "dato";
            // 
            // lista
            // 
            this.lista.FormattingEnabled = true;
            this.lista.Location = new System.Drawing.Point(567, 127);
            this.lista.Name = "lista";
            this.lista.Size = new System.Drawing.Size(120, 95);
            this.lista.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(596, 102);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(42, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "historial";
            // 
            // notificacion
            // 
            this.notificacion.AutoSize = true;
            this.notificacion.Location = new System.Drawing.Point(142, 360);
            this.notificacion.Name = "notificacion";
            this.notificacion.Size = new System.Drawing.Size(0, 13);
            this.notificacion.TabIndex = 11;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(728, 435);
            this.Controls.Add(this.notificacion);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.lista);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Lsalidatiempo);
            this.Controls.Add(this.lresultado);
            this.Controls.Add(this.bmedirSP);
            this.Controls.Add(this.tentrada);
            this.Controls.Add(this.baceptar);
            this.Controls.Add(this.grafica);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.grafica)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataVisualization.Charting.Chart grafica;
        private System.Windows.Forms.Button baceptar;
        private System.Windows.Forms.TextBox tentrada;
        private System.Windows.Forms.Button bmedirSP;
        private System.Windows.Forms.TextBox lresultado;
        private System.Windows.Forms.TextBox Lsalidatiempo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ListBox lista;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label notificacion;
    }
}

