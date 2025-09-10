<template>
  <div class="container">
    <h1>Plataforma de Assinatura Digital</h1>
    <div v-if="step === 1">
      <h2>1. Upload do Documento</h2>
      <input type="file" @change="onFileChange" />
      <button :disabled="!documentFile" @click="step = 2">Próximo</button>
    </div>

    <div v-else-if="step === 2">
      <h2>2. Envolvidos</h2>
      <label>
        Email do Signatário 1:
        <input v-model="signers[0]" placeholder="email1@exemplo.com" />
      </label>
      <label>
        Email do Signatário 2:
        <input v-model="signers[1]" placeholder="email2@exemplo.com" />
      </label>
      <button :disabled="!signers[0] || !signers[1]" @click="step = 3">Próximo</button>
      <button @click="step = 1">Voltar</button>
    </div>

    <div v-else-if="step === 3">
      <h2>3. Envio Seguro do Documento</h2>
      <p>Documento enviado por e-mail apenas para os envolvidos.</p>
      <button @click="step = 4">Simular Acesso Seguro</button>
      <button @click="step = 2">Voltar</button>
    </div>

    <div v-else-if="step === 4">
      <h2>4. Assinatura Digital</h2>
      <div v-for="(signer, idx) in signers" :key="signer">
        <p>
          <strong>{{signer}}</strong> 
          <span v-if="signatures[idx]">Assinou ✔️</span>
          <span v-else>Não Assinou ❌</span>
        </p>
        <button v-if="!signatures[idx]" @click="sign(idx)">
          Assinar como {{signer}}
        </button>
      </div>
      <button :disabled="signatures.includes(false)" @click="step = 5">
        Finalizar
      </button>
      <button @click="step = 3">Voltar</button>
    </div>

    <div v-else-if="step === 5">
      <h2>5. Documento Finalizado</h2>
      <p>O documento foi assinado por todos os envolvidos.</p>
      <button @click="downloadSimulatedPDF">Baixar PDF Final</button>
      <div v-if="pdfUrl">
        <a :href="pdfUrl" download="documento-final.pdf">Clique aqui para baixar</a>
      </div>
      <button @click="reset">Nova Assinatura</button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const step = ref(1)
const documentFile = ref(null)
const signers = ref(['', ''])
const signatures = ref([false, false])
const pdfUrl = ref(null)

function onFileChange(e) {
  documentFile.value = e.target.files[0]
}

function sign(idx) {
  signatures.value[idx] = true
}

function downloadSimulatedPDF() {
  // Simulação: Gera um "PDF" fake como arquivo de texto 
  const data = `
    Documento: ${documentFile.value?.name || 'Sem nome'}
    Assinado por: ${signers.value.join(', ')}
    Data: ${new Date().toLocaleString()}
    (Simulação de PDF final, use backend para gerar de verdade!)
  `
  const blob = new Blob([data], { type: 'application/pdf' })
  pdfUrl.value = URL.createObjectURL(blob)
}

function reset() {
  step.value = 1
  documentFile.value = null
  signers.value = ['', '']
  signatures.value = [false, false]
  pdfUrl.value = null
}
</script>

<style scoped>
.container {
  max-width: 500px;
  margin: auto;
  background: #f5f6fa;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 0 16px #aaa4;
}
input[type="file"] {
  margin-bottom: 1rem;
}
label {
  display: block;
  margin-bottom: 1rem;
}
button {
  margin: 0.5rem 0.5rem 0.5rem 0;
}
</style>
