FROM python:3.13.4-alpine3.22

#Define o diretorio de trabalho dentro do conteiner
WORKDIR /app
# Copia o arquivo requirements.txt para o conteiner e instala as dependencias
COPY requirements.txt .
# Usamos --no-cache-dir para evitar o armazenamento de arquivos em cache, reduzindo o tempo de construção da imagem
RUN pip install --no-cache-dir -r requirements.txt
# Copia o restante do codigo da aplicacao para o diretorio de trabalho
COPY . .
# Expoe a porta que a aplicacao FastAPI irá rodar (padrão 8000)
EXPOSE 8000

# Comando para iniciar a aplicacao usando uvicorn
# O host 0.0.0.0 permite que a aplicacao seja acessada externamente ao conteiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
