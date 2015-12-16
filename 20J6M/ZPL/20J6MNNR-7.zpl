set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0366, <2> 28.0399, <3> 19.8612, <4> 23.2381, <5> 30.0935, <6> 25.4742, <7> 27.1802, <8> 25.5087, <9> 28.3455, <10> 19.9485, <11> 27.8384, <12> 19.7506, <13> 29.2452, <14> 23.6748, <15> 26.5811, <16> 28.9477, <17> 15.0819, <18> 14.3917, <19> 21.3626, <20> 31.2583;
param workload[JOB] := <1> 15.3883, <2> 35.8921, <3> 47.3525, <4> 4.1853, <5> 29.118, <6> 3.9058, <7> 23.9779, <8> 12.959, <9> 18.6329, <10> 2.4299, <11> 40.0841, <12> 26.2406, <13> 41.9429, <14> 15.275, <15> 10.9175, <16> 46.1618, <17> 9.5998, <18> 29.1661, <19> 21.7167, <20> 0.1833;
param capacity[MACHINE] := <1> 435.1295, <2> 435.1295, <3> 435.1295, <4> 435.1295, <5> 435.1295, <6> 435.1295;

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
