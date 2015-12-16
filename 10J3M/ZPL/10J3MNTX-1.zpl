set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.463, <2> 24.8672, <3> 29.9116, <4> 25.3003, <5> 14.8497, <6> 21.6493, <7> 35.7312, <8> 23.7569, <9> 33.3355, <10> 26.1125;
param workload[JOB] := <1> 5.3351, <2> 4.9867, <3> 5.4691, <4> 5.0299, <5> 3.8535, <6> 4.6529, <7> 5.9776, <8> 4.8741, <9> 5.7737, <10> 5.11;
param capacity[MACHINE] := <1> 12.7657, <2> 12.7657, <3> 12.7657;

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
