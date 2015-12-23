set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4035, <2> 23.4189, <3> 21.4769, <4> 28.4261, <5> 24.743, <6> 22.1319, <7> 32.1361, <8> 21.5264, <9> 36.4355, <10> 20.1058, <11> 27.3155, <12> 14.6614, <13> 26.9638, <14> 19.7122, <15> 23.4159, <16> 28.4335, <17> 18.9703, <18> 23.261, <19> 20.4391, <20> 18.0214;
param workload[JOB] := <1> 24.6186, <2> 9.1291, <3> 40.4838, <4> 4.8985, <5> 20.6203, <6> 27.9731, <7> 10.3271, <8> 16.5781, <9> 12.9562, <10> 30.1287, <11> 37.5365, <12> 46.3907, <13> 11.5428, <14> 21.8467, <15> 7.75, <16> 36.8533, <17> 21.1468, <18> 6.9034, <19> 49.3045, <20> 21.3677;
param capacity[MACHINE] := <1> 49.1095, <2> 49.1095, <3> 49.1095, <4> 49.1095, <5> 49.1095, <6> 49.1095, <7> 49.1095;

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