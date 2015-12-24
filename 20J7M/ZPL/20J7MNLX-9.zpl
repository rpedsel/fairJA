set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1489, <2> 22.557, <3> 22.0748, <4> 19.5598, <5> 27.07, <6> 27.2697, <7> 34.4205, <8> 41.423, <9> 31.7593, <10> 21.8937, <11> 25.3583, <12> 27.0034, <13> 30.1967, <14> 23.6129, <15> 24.1099, <16> 26.4189, <17> 35.8496, <18> 21.7787, <19> 16.7123, <20> 21.0901;
param workload[JOB] := <1> 5.2105, <2> 4.7494, <3> 4.6984, <4> 4.4226, <5> 5.2029, <6> 5.222, <7> 5.8669, <8> 6.4361, <9> 5.6355, <10> 4.6791, <11> 5.0357, <12> 5.1965, <13> 5.4952, <14> 4.8593, <15> 4.9102, <16> 5.1399, <17> 5.9875, <18> 4.6668, <19> 4.0881, <20> 4.5924;
param capacity[MACHINE] := <1> 14.585, <2> 14.585, <3> 14.585, <4> 14.585, <5> 14.585, <6> 14.585, <7> 14.585;

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
