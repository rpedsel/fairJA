set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8837, <2> 20.5937, <3> 20.4409, <4> 22.5051, <5> 27.6702, <6> 28.1035, <7> 22.5911, <8> 25.6697, <9> 25.4506, <10> 22.8641, <11> 27.3048, <12> 23.8517, <13> 22.8686, <14> 22.3519, <15> 27.9725, <16> 30.6344, <17> 29.6423, <18> 27.7023, <19> 21.0138, <20> 28.3343;
param workload[JOB] := <1> 19.8837, <2> 20.5937, <3> 20.4409, <4> 22.5051, <5> 27.6702, <6> 28.1035, <7> 22.5911, <8> 25.6697, <9> 25.4506, <10> 22.8641, <11> 27.3048, <12> 23.8517, <13> 22.8686, <14> 22.3519, <15> 27.9725, <16> 30.6344, <17> 29.6423, <18> 27.7023, <19> 21.0138, <20> 28.3343;
param capacity[MACHINE] := <1> 82.9082, <2> 82.9082, <3> 82.9082, <4> 82.9082, <5> 82.9082, <6> 82.9082;

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
