; Generated at 6/11/2016 4:16:44 PM



DebugStub_ProcessCommand:
Call DebugStub_ComReadAL
Push EAX
Cmp AL, DebugStub_Const_Vs2Ds_Noop
JE near DebugStub_ProcessCommand_Exit
Mov EAX, 0
Call DebugStub_ComReadAL
Mov [DebugStub_CommandID], EAX
Mov EAX, [ESP + 0]
Cmp AL, DebugStub_Const_Vs2Ds_TraceOff
JNE near DebugStub_ProcessCommand_Block1_End
Call DebugStub_TraceOff
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block1_End:
Cmp AL, DebugStub_Const_Vs2Ds_TraceOn
JNE near DebugStub_ProcessCommand_Block2_End
Call DebugStub_TraceOn
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block2_End:
Cmp AL, DebugStub_Const_Vs2Ds_Break
JNE near DebugStub_ProcessCommand_Block3_End
Call DebugStub_AckCommand
Call DebugStub_Break
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block3_End:
Cmp AL, DebugStub_Const_Vs2Ds_BreakOnAddress
JNE near DebugStub_ProcessCommand_Block4_End
Call DebugStub_BreakOnAddress
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block4_End:
Cmp AL, DebugStub_Const_Vs2Ds_SendMethodContext
JNE near DebugStub_ProcessCommand_Block5_End
Call DebugStub_SendMethodContext
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block5_End:
Cmp AL, DebugStub_Const_Vs2Ds_SendMemory
JNE near DebugStub_ProcessCommand_Block6_End
Call DebugStub_SendMemory
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block6_End:
Cmp AL, DebugStub_Const_Vs2Ds_SendRegisters
JNE near DebugStub_ProcessCommand_Block7_End
Call DebugStub_SendRegisters
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block7_End:
Cmp AL, DebugStub_Const_Vs2Ds_SendFrame
JNE near DebugStub_ProcessCommand_Block8_End
Call DebugStub_SendFrame
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block8_End:
Cmp AL, DebugStub_Const_Vs2Ds_SendStack
JNE near DebugStub_ProcessCommand_Block9_End
Call DebugStub_SendStack
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block9_End:
Cmp AL, DebugStub_Const_Vs2Ds_Ping
JNE near DebugStub_ProcessCommand_Block10_End
Call DebugStub_Ping
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block10_End:
Cmp AL, DebugStub_Const_Vs2Ds_SetINT3
JNE near DebugStub_ProcessCommand_Block11_End
Call DebugStub_SetINT3
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block11_End:
Cmp AL, DebugStub_Const_Vs2Ds_ClearINT3
JNE near DebugStub_ProcessCommand_Block12_End
Call DebugStub_ClearINT3
Call DebugStub_AckCommand
Jmp DebugStub_ProcessCommand_Exit

DebugStub_ProcessCommand_Block12_End:

DebugStub_ProcessCommand_Exit:
Pop EAX
mov dword [static_field__Cosmos_Core_INTs_mLastKnownAddress], DebugStub_ProcessCommand_Exit
Ret


DebugStub_AckCommand:
Mov AL, DebugStub_Const_Ds2Vs_CmdCompleted
Call DebugStub_ComWriteAL
Mov EAX, [DebugStub_CommandID]
Call DebugStub_ComWriteAL

DebugStub_AckCommand_Exit:
mov dword [static_field__Cosmos_Core_INTs_mLastKnownAddress], DebugStub_AckCommand_Exit
Ret


DebugStub_ProcessCommandBatch:

DebugStub_ProcessCommandBatch_Begin:
Call DebugStub_ProcessCommand
Cmp AL, 8
JNE near DebugStub_ProcessCommandBatch_Begin
Call DebugStub_AckCommand

DebugStub_ProcessCommandBatch_Exit:
mov dword [static_field__Cosmos_Core_INTs_mLastKnownAddress], DebugStub_ProcessCommandBatch_Exit
Ret

