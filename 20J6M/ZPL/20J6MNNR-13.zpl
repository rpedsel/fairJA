set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6245, <2> 37.1606, <3> 26.24, <4> 24.5617, <5> 21.3882, <6> 30.1889, <7> 28.8841, <8> 27.2233, <9> 31.716, <10> 26.7669, <11> 25.4065, <12> 23.5994, <13> 29.5171, <14> 20.778, <15> 20.5827, <16> 20.8849, <17> 27.4752, <18> 22.5763, <19> 26.4246, <20> 20.9877;
param workload[JOB] := <1> 8.517, <2> 13.6621, <3> 1.6965, <4> 11.1452, <5> 10.2119, <6> 25.6535, <7> 11.69, <8> 48.8722, <9> 9.4242, <10> 27.3696, <11> 2.1058, <12> 44.9517, <13> 40.1426, <14> 45.6361, <15> 7.8866, <16> 12.6823, <17> 48.8967, <18> 31.3304, <19> 42.0112, <20> 20.1318;
param capacity[MACHINE] := <1> 464.0174, <2> 464.0174, <3> 464.0174, <4> 464.0174, <5> 464.0174, <6> 464.0174;

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
