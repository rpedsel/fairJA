set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6701, <2> 18.2115, <3> 34.4392, <4> 25.6342, <5> 26.8971, <6> 30.5231, <7> 35.7032, <8> 32.1665, <9> 21.3759, <10> 22.3269, <11> 28.0205, <12> 28.1232, <13> 22.9336, <14> 28.2012, <15> 30.7814, <16> 27.4345, <17> 18.7113, <18> 28.5013, <19> 31.7734, <20> 29.4117;
param workload[JOB] := <1> 26.6701, <2> 18.2115, <3> 34.4392, <4> 25.6342, <5> 26.8971, <6> 30.5231, <7> 35.7032, <8> 32.1665, <9> 21.3759, <10> 22.3269, <11> 28.0205, <12> 28.1232, <13> 22.9336, <14> 28.2012, <15> 30.7814, <16> 27.4345, <17> 18.7113, <18> 28.5013, <19> 31.7734, <20> 29.4117;
param capacity[MACHINE] := <1> 78.2628, <2> 78.2628, <3> 78.2628, <4> 78.2628, <5> 78.2628, <6> 78.2628, <7> 78.2628;

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
