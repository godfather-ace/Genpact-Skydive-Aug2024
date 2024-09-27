import streamlit as st
from llama_index.core import (
    Settings,
    VectorStoreIndex, 
    SimpleDirectoryReader, 
)
from llama_index.core.node_parser import SentenceSplitter
from llama_index.embeddings.huggingface import HuggingFaceEmbedding
from llama_index.llms.cohere import Cohere
from dotenv import load_dotenv
import os

load_dotenv()
COHERE_API_KEY = os.getenv("COHERE_API_KEY")

embed_model = HuggingFaceEmbedding(model_name="BAAI/bge-small-en-v1.5")
Settings.text_splitter = SentenceSplitter(chunk_size=1024)
Settings.llm = Cohere(model = 'command-r', api_key = COHERE_API_KEY)
Settings.embed_model = embed_model

reader = SimpleDirectoryReader(input_dir="sample_data_files")
documents = reader.load_data()

index = VectorStoreIndex.from_documents(documents)

query_engine = index.as_query_engine()

st.title("RAG Chatbot based on Cohere LLM and LlamaIndex")
query = st.text_input("Who is Tyrion?")

if st.button("Submit"):
    if not query.strip():
        st.error("Please provide the search query")
    else: 
        try: 
            response = query_engine.query(query)
            st.success(response)
        except Exception as e: 
            st.error(f"An error occured: {e}")    
    

