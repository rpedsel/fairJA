set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.126, <2> 26.0897, <3> 19.4303, <4> 9.0976, <5> 26.7166, <6> 26.213, <7> 24.305, <8> 25.5859, <9> 19.0829, <10> 17.0454, <11> 23.1459, <12> 20.5888, <13> 36.6103, <14> 16.2839, <15> 24.5811, <16> 18.0411, <17> 24.3618, <18> 19.12, <19> 30.03, <20> 20.4374;
param workload[JOB] := <1> 21.126, <2> 26.0897, <3> 19.4303, <4> 9.0976, <5> 26.7166, <6> 26.213, <7> 24.305, <8> 25.5859, <9> 19.0829, <10> 17.0454, <11> 23.1459, <12> 20.5888, <13> 36.6103, <14> 16.2839, <15> 24.5811, <16> 18.0411, <17> 24.3618, <18> 19.12, <19> 30.03, <20> 20.4374;
param capacity[MACHINE] := <1> 55.9866, <2> 55.9866, <3> 55.9866, <4> 55.9866, <5> 55.9866, <6> 55.9866;

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
