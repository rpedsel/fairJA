set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.1226, <2> 5.4959, <3> 49.1504, <4> 39.3368, <5> 0.3428, <6> 24.8971, <7> 45.2523, <8> 23.1877, <9> 38.9028, <10> 38.02, <11> 41.9776, <12> 21.4881, <13> 3.9443, <14> 21.492, <15> 21.0819, <16> 34.8914, <17> 47.3428, <18> 45.4184, <19> 15.6759, <20> 14.1292;
param workload[JOB] := <1> 228.693, <2> 30.2049, <3> 2415.7618, <4> 1547.3838, <5> 0.1175, <6> 619.8656, <7> 2047.7707, <8> 537.6694, <9> 1513.4278, <10> 1445.5204, <11> 1762.1189, <12> 461.7384, <13> 15.5575, <14> 461.9061, <15> 444.4465, <16> 1217.4098, <17> 2241.3407, <18> 2062.8311, <19> 245.7338, <20> 199.6343;
param capacity[MACHINE] := <1> 2692.2135, <2> 2692.2135, <3> 2692.2135, <4> 2692.2135, <5> 2692.2135, <6> 2692.2135, <7> 2692.2135;

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
