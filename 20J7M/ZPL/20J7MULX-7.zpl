set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.5521, <2> 38.7249, <3> 12.6332, <4> 40.1563, <5> 11.369, <6> 36.1393, <7> 1.4204, <8> 11.719, <9> 0.2159, <10> 2.8987, <11> 21.5704, <12> 26.1086, <13> 20.747, <14> 5.5518, <15> 47.2217, <16> 38.825, <17> 20.4699, <18> 41.6281, <19> 10.2146, <20> 37.9061;
param workload[JOB] := <1> 5.7054, <2> 6.2229, <3> 3.5543, <4> 6.3369, <5> 3.3718, <6> 6.0116, <7> 1.1918, <8> 3.4233, <9> 0.4647, <10> 1.7026, <11> 4.6444, <12> 5.1097, <13> 4.5549, <14> 2.3562, <15> 6.8718, <16> 6.231, <17> 4.5244, <18> 6.452, <19> 3.196, <20> 6.1568;
param capacity[MACHINE] := <1> 12.5832, <2> 12.5832, <3> 12.5832, <4> 12.5832, <5> 12.5832, <6> 12.5832, <7> 12.5832;

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
