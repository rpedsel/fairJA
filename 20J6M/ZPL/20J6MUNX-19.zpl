set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1024, <2> 31.8324, <3> 48.0183, <4> 16.4713, <5> 41.5452, <6> 35.8371, <7> 6.8232, <8> 33.6106, <9> 11.2429, <10> 28.7427, <11> 29.5108, <12> 1.4394, <13> 43.3486, <14> 28.9283, <15> 6.2392, <16> 12.0664, <17> 2.3582, <18> 38.2113, <19> 30.4861, <20> 35.0963;
param workload[JOB] := <1> 5.0102, <2> 5.642, <3> 6.9295, <4> 4.0585, <5> 6.4456, <6> 5.9864, <7> 2.6121, <8> 5.7975, <9> 3.353, <10> 5.3612, <11> 5.4324, <12> 1.1997, <13> 6.584, <14> 5.3785, <15> 2.4978, <16> 3.4737, <17> 1.5356, <18> 6.1815, <19> 5.5214, <20> 5.9242;
param capacity[MACHINE] := <1> 94.9248, <2> 94.9248, <3> 94.9248, <4> 94.9248, <5> 94.9248, <6> 94.9248;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
