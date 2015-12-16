set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.9051, <2> 14.0244, <3> 32.2011, <4> 38.6348, <5> 4.3128, <6> 26.1021, <7> 37.8613, <8> 43.9636, <9> 22.7787, <10> 7.8195, <11> 10.2489, <12> 7.9551, <13> 48.2982, <14> 40.16, <15> 44.4153, <16> 25.8743, <17> 49.7777, <18> 28.9941, <19> 3.1742, <20> 26.6794;
param workload[JOB] := <1> 1.3803, <2> 3.7449, <3> 5.6746, <4> 6.2157, <5> 2.0767, <6> 5.109, <7> 6.1532, <8> 6.6305, <9> 4.7727, <10> 2.7963, <11> 3.2014, <12> 2.8205, <13> 6.9497, <14> 6.3372, <15> 6.6645, <16> 5.0867, <17> 7.0553, <18> 5.3846, <19> 1.7816, <20> 5.1652;
param capacity[MACHINE] := <1> 15.8334, <2> 15.8334, <3> 15.8334, <4> 15.8334, <5> 15.8334, <6> 15.8334;

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
